import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/image_management/domain/usecase/get_image_url_use_case.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/domain/usecase/share_recipe_steps_use_case.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/domain/usecase/share_recipe_use_case.dart';
import 'package:flutter_food_recipe_application/product/firebase/firebase_constants.dart';
import 'package:flutter_food_recipe_application/product/models/recipe_step_input_model.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/entity/recipe_entity.dart';
import 'package:flutter_food_recipe_application/feauture/image_management/domain/usecase/crop_image_use_case.dart';
import 'package:flutter_food_recipe_application/feauture/image_management/domain/usecase/get_image_file_use_case.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/entity/recipe_step_entity.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

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

  RecipeEntity recipeEntity = RecipeEntity(
    recipeTitle: 'aaaaa',
    recipeDescription: '',
    cookingType: '',
    worldKitchen: '',
    recipeIngredients: [''],
    cookingDuration: 30,
  );

  List<RecipeStepInputModel> _steps = [];
  List<RecipeStepInputModel> get steps => _steps;

  File? _selectedRecipeImage;
  File? get selectedRecipeImage => _selectedRecipeImage;

  void setState(ViewState state) {
    _state = state;
    notifyListeners();
  }

// PAGE 1///////////////////////////////////////////////////////////////////////////////
  void setInputsPage1({
    required String recipeName,
    required String recipeDescription,
  }) {
    recipeEntity = recipeEntity.copyWith(
      recipeTitle: recipeName,
      recipeDescription: recipeDescription,
    );
    notifyListeners();
  }
///////////////////////////////////////////////////////////////////////////////////

  ///PAGE 2 //////////////////////////// ////////////////////////////////////////////////

  void valueSetterCookingType(String value) {
    recipeEntity = recipeEntity.copyWith(cookingType: value);
  }

  void valueSetterWorldKitchen(String value) {
    recipeEntity = recipeEntity.copyWith(worldKitchen: value);
  }

  void setCookingDuration(double value) {
    recipeEntity = recipeEntity.copyWith(cookingDuration: value);
    notifyListeners();
  }
////////////////////////////////////////////////////////////////////////////////////////

  ///PAGE 3 //////////////////////////// ////////////////////////////////////////////////
  void updateIngredientList({required List<String> ingredientList}) {
    recipeEntity = recipeEntity.copyWith(recipeIngredients: ingredientList);
    notifyListeners();
  }

  void updateStepList(List<RecipeStepInputModel> stepList) {
    _steps = stepList;
    notifyListeners();
  }

////////////////////////////////////////////////////////////////////////////////////////

  ///PAGE 4 //////////////////////////// ////////////////////////////////////////////////

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
    final result = await shareRecipeUseCase.call(
      recipeEntity: RecipeEntity(
        postId: postId,
        userId: postId,
        recipeTitle: 'recipeName',
        recipeDescription: 'recipeDescription',
        imageUrl: recipeImageUrl,
        cookingDuration: 30,
        recipeIngredients: ['_ingredients'],
        sharedTime: DateTime.now().toUtc(),
        worldKitchen: '_worldKitchen',
        cookingType: '_cookingType',
        recipeStepIds: stepIds,
      ),
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
    //_recipeSteps = [''];
    // imageUrl = null;
    notifyListeners();
  }
}
