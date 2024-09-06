import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/view/share_recipe_view.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/viewmodel/share_recipe_view_model.dart';
import 'package:flutter_food_recipe_application/product/componets/custom_sheets.dart';
import 'package:flutter_food_recipe_application/product/componets/custom_snack_bars.dart';
import 'package:flutter_food_recipe_application/product/models/recipe_step_input_model.dart';
import 'package:uuid/uuid.dart';

mixin InputPage4Mixin on State<InputPage4> {
  final List<RecipeStepInputModel> _inputSteps = [];
  List<RecipeStepInputModel> get steps => _inputSteps;

  ///init state içimdeki işlemler fazla olursa ekrana çizim yap çizimden sonra methodları çalıştır k
  ///ki  geçislerde kasma olmasın

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeSteps();
    });
  }

  /// ViewModel'deki adımları başlatmak veya varsayılan bir adım eklemek için kullanılır
  void _initializeSteps() {
    final viewModelSteps = context.read<ShareRecipeViewModel>().steps;
    if (viewModelSteps.isNotEmpty) {
      _inputSteps.addAll(viewModelSteps);
    } else {
      _addDefaultStep();
    }
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// ViewModel'deki adım listesini günceller ve boş adımları temizler
  void updateViewModelSteps() {
    _removeEmphtySteps();
    context.read<ShareRecipeViewModel>().updateStepList(_inputSteps);
  }

  /// Boş olan tüm adımları temizler
  void _removeEmphtySteps() {
    _inputSteps.removeWhere(
      (element) => element.controller.text.trim().isEmpty,
    );
  }

  /// Varsayılan boş bir adım ekler
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

  /// Mevcut adımın geçerli olup olmadığını kontrol eder ve yeni bir adım ekler
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
        text: 'Lütfen mevcut adımı doldurun.',
      );
    }
  }

  /// Geçerli adımı doğrular
  bool isCurrentStepValid() {
    return _inputSteps.every((step) => step.controller.text.isNotEmpty);
  }

  void removeStep(int index) {
    _inputSteps[index].controller.dispose();
    _inputSteps[index].focusNode.dispose();
    _inputSteps.removeAt(index);
    setState(() {});
  }

  /// Adım için bir resim seçer ve günceller
  Future<void> getStepImageFile(int index) async {
    _toggleStepLoading(index, true);
    final selectedSource =
        await CustomSheets.showMenuForImage(context: context);
    final imageFile = await context
        .read<ShareRecipeViewModel>()
        .getImageSourceAndProcessImageStep(
          selectedSource: selectedSource,
        );
    final updatedStep = _inputSteps[index].copyWith(
      stepImageFile: imageFile,
      loading: false,
    );
    _inputSteps[index] = updatedStep;
    setState(() {});
  }

  /// Adımın yüklenme durumunu değiştirir
  void _toggleStepLoading(int index, bool isLoading) {
    _inputSteps[index] = _inputSteps[index].copyWith(loading: isLoading);
    setState(() {});
  }

  void previousPage() {
    FocusScope.of(context).unfocus();
    updateViewModelSteps();
    widget.pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
    );
  }

  /// Tarifi paylaşır ve adım adım paylaşım işlemlerini gerçekleştirir
  Future<void> shareRecipe() async {
    FocusScope.of(context).unfocus();

    // Async işlemler sırasında context kullanımını mounted kontrolü ile güvence altına alıyoruz
    if (!mounted) return;
    context.read<ShareRecipeViewModel>().changeLoading();

    updateViewModelSteps();

    final postId = const Uuid().v1();

    // İlk async işlem
    final recipeResult =
        await context.read<ShareRecipeViewModel>().shareRecipe(postId: postId);

    if (!mounted) {
      return; // Async işlemden sonra context'in hala mevcut olup olmadığını kontrol et
    }
    if (!recipeResult) {
      _showErrorSnackbar('Bir Sorun Oluştu. Lütfen daha sonra tekrar deneyin.');
      return;
    }

    // İkinci async işlem
    final stepsResult = await context
        .read<ShareRecipeViewModel>()
        .shareRecipeSteps(postId: postId);

    if (!mounted) {
      return; // Async işlemden sonra context'in hala mevcut olup olmadığını kontrol et
    }
    context.read<ShareRecipeViewModel>().changeLoading();

    if (!stepsResult) {
      _showErrorSnackbar('Bir Sorun Oluştu. Lütfen daha sonra tekrar deneyin.');
    } else {
      await NavigatorService.pushNamedAndRemoveUntil(AppRoutes.navBarView);
    }
  }

  /// Hata mesajını gösterir
  void _showErrorSnackbar(String message) {
    CustomSnackBars.showRecipeScaffoldSnackBar(
      context: context,
      text: message,
    );
  }
  /* Future<void> shareRecipe() async {
    FocusScope.of(context).unfocus();
    context.read<ShareRecipeViewModel>().changeLoading();
    updateViewModelSteps();
    final postId = const Uuid().v1();
    final result =
        await context.read<ShareRecipeViewModel>().shareRecipe(postId: postId);
    if (result == false) {
      CustomSnackBars.showRecipeScaffoldSnackBar(
        context: context,
        text: 'Bir Sorun Oluştu. Lütfen daha sonra tekrar deneyin.',
      );
    } else {
      final resultSteps = await context
          .read<ShareRecipeViewModel>()
          .shareRecipeSteps(postId: postId);
      context.read<ShareRecipeViewModel>().changeLoading();
      if (resultSteps == false) {
        CustomSnackBars.showRecipeScaffoldSnackBar(
          context: context,
          text: 'Bir Sorun Oluştu. Lütfen daha sonra tekrar deneyin.',
        );
      } else {
        await NavigatorService.pushNamedAndRemoveUntil(AppRoutes.navBarView);
      }
    }
  }*/
}
