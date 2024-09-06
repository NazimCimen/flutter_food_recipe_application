import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/share_recipe_export.dart';

enum ViewState { inActive, error, success, loading }

class ShareRecipeViewModel extends ChangeNotifier {
  final GetImageUrlUseCase getImageUrlUseCase;
  final ShareRecipeUseCase shareRecipeUseCase;
  final ShareRecipeStepsUseCase shareRecipeStepsUseCase;
  final GetImageFileUseCase getImageUseCase;
  final CropImageUseCase cropImageUseCase;
  ShareRecipeViewModel({
    required this.cropImageUseCase,
    required this.getImageUseCase,
    required this.getImageUrlUseCase,
    required this.shareRecipeUseCase,
    required this.shareRecipeStepsUseCase,
  });
  ViewState _state = ViewState.inActive;
  ViewState get state => _state;

  RecipeEntity _recipeEntity = const RecipeEntity(
    recipeTitle: '',
    recipeDescription: '',
    cookingType: '',
    worldKitchen: '',
    recipeIngredients: [''],
    cookingDuration: 30,
  );
  RecipeEntity get recipeEntity => _recipeEntity;

  List<RecipeStepInputModel> _steps = [];
  List<RecipeStepInputModel> get steps => _steps;

  File? _selectedRecipeImage;
  File? get selectedRecipeImage => _selectedRecipeImage;

  void setState(ViewState state) {
    _state = state;
    notifyListeners();
  }

  void setRecipeTitleAndDesc({
    required String recipeName,
    required String recipeDescription,
  }) {
    _recipeEntity = recipeEntity.copyWith(
      recipeTitle: recipeName,
      recipeDescription: recipeDescription,
    );
    notifyListeners();
  }

  void valueSetterCookingType(String value) {
    _recipeEntity = _recipeEntity.copyWith(cookingType: value);
  }

  void valueSetterWorldKitchen(String value) {
    _recipeEntity = _recipeEntity.copyWith(worldKitchen: value);
  }

  void setCookingDuration(double value) {
    _recipeEntity = _recipeEntity.copyWith(cookingDuration: value);
    notifyListeners();
  }

  void updateIngredientList({required List<String> ingredientList}) {
    _recipeEntity = _recipeEntity.copyWith(recipeIngredients: ingredientList);
    notifyListeners();
  }

  void updateStepList(List<RecipeStepInputModel> stepList) {
    _steps = stepList;
    notifyListeners();
  }

  Future<void> getRecipeImage({
    required ImageSource selectedSource,
    required CropAspectRatio aspectRatio,
  }) async {
    _selectedRecipeImage = await selectAndCropImage(
      selectedSource: selectedSource,
      aspectRatio: aspectRatio,
    );
  }

  Future<File?> getStepImage({
    required ImageSource selectedSource,
    required CropAspectRatio aspectRatio,
  }) async {
    return selectAndCropImage(
      selectedSource: selectedSource,
      aspectRatio: aspectRatio,
    );
  }

  Future<File?> selectAndCropImage({
    required ImageSource selectedSource,
    required CropAspectRatio aspectRatio,
  }) async {
    final result = await getImageUseCase.call(source: selectedSource);
    return result.fold(
      (fail) => null,
      (image) async {
        if (image != null) {
          final croppedResult = await cropImageUseCase.call(
            imageFile: image,
            cropAspectRatio: aspectRatio,
          );
          return croppedResult.fold(
            (fail) => null,
            (croppedImage) => croppedImage,
          );
        }
        return null;
      },
    );
  }

  Future<String> getImageUrl({
    required File? imageFile,
    required String defaultIUrl,
  }) async {
    var imageUrl = defaultIUrl;
    if (imageFile == null) return imageUrl;
    final response = await getImageUrlUseCase.call(imageFile: imageFile);
    response.fold(
      (failure) {},
      (url) {
        if (url != null) {
          imageUrl = url;
        }
      },
    );
    return imageUrl;
  }

  /// user ıd'yi eklemeyi unutma
  Future<bool> shareRecipe({required String postId}) async {
    final entityList = await convertStepInputListToEntityList();
    final stepIds = extractStepIds(entityList);
    final recipeImageUrl = await getImageUrl(
      imageFile: _selectedRecipeImage,
      defaultIUrl: FirebaseConstants.defaultRecipeImageUrl,
    );
    _recipeEntity = _recipeEntity = _recipeEntity.copyWith(
      postId: const Uuid().v1(),
      recipeStepIds: stepIds,
      imageUrl: recipeImageUrl,
      sharedTime: DateTime.now().toUtc(),
    );
    final result = await shareRecipeUseCase.call(
      recipeEntity: _recipeEntity,
    );
    var succes = false;
    result.fold(
      (failure) {
        succes = true;
      },
      (result) {
        succes = result;
      },
    );

    return succes;
  }

  Future<bool> shareRecipeSteps({required String postId}) async {
    final entityList = await convertStepInputListToEntityList();
    final result = await shareRecipeStepsUseCase.call(
      recipeStepEntityList: entityList,
      postId: postId,
    );
    var succes = false;
    result.fold(
      (failure) {
        succes = true;
      },
      (result) {
        succes = result;
      },
    );

    return succes;
  }

  ///dispose etmeyi unutma......
  Future<List<RecipeStepEntity>> convertStepInputListToEntityList() async {
    final stepEntities = await Future.wait(
      _steps.map((inputStep) async {
        final url = await getImageUrl(
          imageFile: inputStep.stepImageFile,
          defaultIUrl: FirebaseConstants.defaultRecipeStepImageUrl,
        );
        return RecipeStepEntity(
          id: const Uuid().v1(),
          stepNumber: _steps.indexOf(inputStep) + 1,
          stepDescription: inputStep.controller.text,
          stepImageUrl: url,
        );
      }),
    );
    return stepEntities;
  }

  /// Bu metot entity listesi alır ve her bir entity'nin id'sini liste olarak döner.
  List<String> extractStepIds(List<RecipeStepEntity> entityList) {
    return entityList.map((entity) => entity.id).whereType<String>().toList();
  }

  void reset() {
    _recipeEntity = const RecipeEntity(
      recipeTitle: '',
      recipeDescription: '',
      cookingType: '',
      worldKitchen: '',
      recipeIngredients: [''],
      cookingDuration: 30,
    );

    for (final step in _steps) {
      step.controller.dispose();
      step.focusNode.dispose();
    }
    _steps.clear();
    _selectedRecipeImage = null;
    setState(ViewState.inActive);
    notifyListeners();
  }
}
