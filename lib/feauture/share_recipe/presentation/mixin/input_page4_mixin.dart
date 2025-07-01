import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/share_recipe_export.dart';

mixin InputPage4Mixin on State<InputPage4> {
  // List to store the step inputs
  final List<RecipeStepInputModel> _inputSteps = [];

  // Exposing the steps list through a getter
  List<RecipeStepInputModel> get steps => _inputSteps;

  /// If there are intensive operations in initState, we execute these operations
  /// after the screen rendering is complete to avoid lag during transitions.
  @override
  void initState() {
    super.initState();
    // Initializing steps after the screen rendering is complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeSteps();
    });
  }

  /// Initializes the steps from the ViewModel or adds a default step if none exist
  void _initializeSteps() {
    final viewModelSteps = context.read<ShareRecipeViewModel>().steps;
    if (viewModelSteps.isNotEmpty) {
      _inputSteps.addAll(viewModelSteps);
    } else {
      _addDefaultStep();
    }
    setState(() {});
  }

  /// Disposes controllers and focus nodes for each step to prevent memory leaks
  @override
  void dispose() {
    for (var step in _inputSteps) {
      step.controller.dispose();
      step.focusNode.dispose();
    }
    _inputSteps.clear();
    super.dispose();
  }

  /// Updates the step list in the ViewModel and removes empty steps
  void updateViewModelSteps() {
    _removeEmphtySteps();
    context.read<ShareRecipeViewModel>().updateStepList(_inputSteps);
  }

  /// Removes all empty steps
  void _removeEmphtySteps() {
    _inputSteps.removeWhere(
      (element) => element.controller.text.trim().isEmpty,
    );
  }

  /// Adds a default empty step
  void _addDefaultStep() {
    _inputSteps.add(
      RecipeStepInputModel(
        controller: TextEditingController(),
        focusNode: FocusNode(),
        stepImageFile: null,
        loading: false,
      ),
    );
  }

  /// Checks if the current step is valid and adds a new step if valid
  void addNewStep() {
    final isValid = isCurrentStepValid();
    if (isValid) {
      if (_inputSteps.isNotEmpty) {
        _inputSteps.last.focusNode.unfocus();
      }

      final newStep = RecipeStepInputModel(
        controller: TextEditingController(),
        focusNode: FocusNode(),
        stepImageFile: null,
        loading: false,
      );

      _inputSteps.add(newStep);
      setState(() {});
      Future.delayed(const Duration(milliseconds: 100), () {
        FocusScope.of(context).requestFocus(newStep.focusNode);
      });
    } else {
      CustomSnackBars.showRecipeScaffoldSnackBar(
        context: context,
        text: 'Please fill in the current step.',
      );
    }
  }

  /// Validates if the current step is filled
  bool isCurrentStepValid() {
    return _inputSteps.every((step) => step.controller.text.isNotEmpty);
  }

  /// Removes a step at the given index and disposes its controllers
  void removeStep(int index) {
    _inputSteps[index].controller.dispose();
    _inputSteps[index].focusNode.dispose();
    _inputSteps.removeAt(index);
    setState(() {});
  }

  /// Selects an image for a step and updates it
  Future<void> getStepImageFile(int index) async {
    _toggleStepLoading(index, true);
    final selectedSource =
        await CustomSheets.showMenuForImage(context: context);
    if (selectedSource != null) {
      final imageFile = await context.read<ShareRecipeViewModel>().getStepImage(
            selectedSource: selectedSource,
            aspectRatio: ImageAspectRatioEnum.stepAspectRatio.ratioCrop,
          );
      final updatedStep = _inputSteps[index].copyWith(
        stepImageFile: imageFile,
        loading: false,
      );
      _inputSteps[index] = updatedStep;
    }
    _toggleStepLoading(index, false);
  }

  /// Toggles the loading state of a step
  void _toggleStepLoading(int index, bool isLoading) {
    _inputSteps[index] = _inputSteps[index].copyWith(loading: isLoading);
    setState(() {});
  }

  /// Navigates to the previous page after unfocusing and updating steps
  void previousPage() {
    FocusScope.of(context).unfocus();
    updateViewModelSteps();
    widget.pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
    );
  }

  /// Shares the recipe and performs step-by-step sharing processes
  Future<void> shareRecipe() async {
    FocusScope.of(context).unfocus();

    // Ensuring safe context usage during async operations with mounted check
    if (!mounted) return;
    context.read<ShareRecipeViewModel>().setState(ViewState.loading);

    updateViewModelSteps();

    final postId = const Uuid().v1();

    // First async operation
    final recipeResult =
        await context.read<ShareRecipeViewModel>().shareRecipe(postId: postId);

    if (!mounted) {
      return;
    }
    if (!recipeResult) {
      _showErrorSnackbar('An error occurred. Please try again later.');
      return;
    }

    // Second async operation
    final stepsResult = await context
        .read<ShareRecipeViewModel>()
        .shareRecipeSteps(postId: postId);

    if (!mounted) {
      return;
    }
    context.read<ShareRecipeViewModel>().setState(ViewState.inActive);

    if (!stepsResult) {
      _showErrorSnackbar('An error occurred. Please try again later.');
    } else {
      context.read<ShareRecipeViewModel>().reset();
      await NavigatorService.pushNamedAndRemoveUntil(AppRoutes.navBarView);
    }
  }

  /// Displays an error message using a snackbar
  void _showErrorSnackbar(String message) {
    CustomSnackBars.showRecipeScaffoldSnackBar(
      context: context,
      text: message,
    );
  }
}
