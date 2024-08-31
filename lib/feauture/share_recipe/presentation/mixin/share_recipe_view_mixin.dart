import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/view/share_recipe_view.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/viewmodel/share_recipe_view_model.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/entity/recipe_step_entity.dart';
import 'package:flutter_food_recipe_application/product/componets/custom_snack_bars.dart';

mixin ShareRecipeViewMixin on State<ShareRecipeView> {
  late PageController pageController;
  late TextEditingController recipeNameController;
  late TextEditingController recipeDescriptionController;
  late GlobalKey<FormState> page1FormKey;

  late AppValidators validators;
  int _currentPage = 0;
  int get currentPage => _currentPage;
  final int _totalPages = 4;
  int get totalPage => _totalPages;

  List<RecipeStepEntity> recipeSteps = [];
  List<FocusNode> focusNodes = [];
  List<TextEditingController> recipeStepControllers = [];

  void onPageChanged(int index) {
    _currentPage = index;
    setState(() {});
  }

  @override
  void initState() {
    page1FormKey = GlobalKey<FormState>();
    validators = AppValidators();
    pageController = PageController();
    recipeNameController = TextEditingController();
    recipeDescriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    for (final node in focusNodes) {
      node.dispose();
    }
    for (final controller in recipeStepControllers) {
      controller.dispose();
    }
    recipeNameController.dispose();
    recipeDescriptionController.dispose();
    pageController.dispose();
    super.dispose();
  }

  /// this method ovveried in view.
  void showScaffoldSnackBar() {
    CustomSnackBars.showRecipeScaffoldSnackBar(
      context: context,
      text: 'Lütfen bir resim seçiniz.',
    );
  }

  bool validateFields() {
    if (page1FormKey.currentState!.validate()) {
      if (context.read<ShareRecipeViewModel>().croppedImage == null) {
        showScaffoldSnackBar();
        return false;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  void nextPage() {
    FocusScope.of(context).unfocus();
    if (_currentPage == 0) {
      final isValidate = validateFields();
      if (isValidate) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.linearToEaseOut,
        );
      }
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.linearToEaseOut,
      );
    }
  }

  void previusPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
    );
  }

  Future<void> shareRecipe() async {
    final shareRecipeViewModel = context.read<ShareRecipeViewModel>();

    await shareRecipeViewModel.getImageUrl();

    final navigate = await shareRecipeViewModel.shareRecipe(
      recipeTitle: recipeNameController.text,
      recipeDescription: recipeDescriptionController.text,
    );
    shareRecipeViewModel.reset();
    if (navigate == true) {
      await NavigatorService.pushNamedAndRemoveUntil(
        AppRoutes.navBarView,
      );
    }
  }
}
