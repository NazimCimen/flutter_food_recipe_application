import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/domain/usecase/get_image_url_use_case.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/domain/usecase/share_recipe_steps_use_case.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/domain/usecase/share_recipe_use_case.dart';
import 'package:flutter_food_recipe_application/product/constants/image_aspect_ratio.dart';
import 'package:flutter_food_recipe_application/product/models/recipe_step_input_model.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/entity/recipe_entity.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/domain/usecase/crop_image_use_case.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/domain/usecase/get_image_use_case.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/entity/recipe_step_entity.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class ShareRecipeViewModel extends ChangeNotifier {
  final GetImageUseCase getImageUseCase;
  final CropImageUseCase cropImageUseCase;
  final GetImageUrlUseCase getImageUrlUseCase;
  final ShareRecipeUseCase shareRecipeUseCase;
  final ShareRecipeStepsUseCase shareRecipeStepsUseCase;

  ShareRecipeViewModel({
    required this.getImageUseCase,
    required this.cropImageUseCase,
    required this.getImageUrlUseCase,
    required this.shareRecipeUseCase,
    required this.shareRecipeStepsUseCase,
  });

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void changeLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

/////////////////////////////////////////////////////////////////////
  List<String> _ingredients = [''];
  List<String> get ingredients => _ingredients;
  void updateIngredientList({required List<String> ingredientList}) {
    _ingredients = ingredientList;
    notifyListeners();
  }

/////////////////////////////////////////////////////////////////////
  List<RecipeStepInputModel> _steps = [];

  List<RecipeStepInputModel> get steps => _steps;
  void updateStepList(List<RecipeStepInputModel> stepList) {
    _steps = stepList;
    notifyListeners();
  }

///////////////////////////// PAGE 1 //////////////////////////////////////////////////////

  File? _croppedImage;
  File? get croppedImage => _croppedImage;

  File? _selectedImage;
  File? get selectedImage => _selectedImage;

  String _recipeName = '';
  String get recipeName => _recipeName;

  String _recipeDescription = '';
  String get recipeDescription => _recipeDescription;

  void setInputsPage1({
    required String recipeName,
    required String recipeDescription,
  }) {
    _recipeName = recipeName;
    _recipeDescription = recipeDescription;
  }

////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////// PAGE 2 ////////////////////////////////////////////////
  double _cookingDuration = 30;
  double get cookingDuration => _cookingDuration;

  String _cookingType = '';
  String get cookingType => _cookingType;

  String _worldKitchen = '';
  String get worldKitchen => _worldKitchen;

  void valueSetterCookingType(String value) {
    _cookingType = value;
  }

  void valueSetterWorldKitchen(String value) {
    _worldKitchen = value;
  }

  void setInputsPage2({
    required String recipeworldKitchen,
    required String recipecookingType,
  }) {
    _worldKitchen = recipeworldKitchen;
    _cookingType = recipecookingType;
  }

////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////

  Future<void> getRecipeImage({required ImageSource source}) async {
    _selectedImage = null;
    final result = await getImageUseCase.call(source: source);
    result.fold(
      (fail) {
        print('fail');
      },
      (image) {
        if (image != null) {
          _selectedImage = image;
        }
      },
    );
  }

  Future<File?> getImageSourceAndProcessImageStep({
    required ImageSource? selectedSource,
  }) async {
    File? pickedImage;
    if (selectedSource != null) {
      final result = await getImageUseCase.call(source: selectedSource);
      result.fold(
        (fail) {
          print('fail');
        },
        (image) {
          if (image != null) {
            pickedImage = image;
          }
        },
      );
      if (pickedImage != null) {
        _croppedImage = null;
        final result = await cropImageUseCase.call(
          imageFile: pickedImage!,
          cropAspectRatio: const CropAspectRatio(ratioX: 16, ratioY: 9),
        );
        result.fold(
          (fail) {
            print('fail');
          },
          (image) {
            if (image != null) {
              _croppedImage = image;
            }
          },
        );
        return _croppedImage;
      }
    }
    return null;
  }

  Future<void> getImageSourceAndProcessImage(
      {required ImageSource? selectedSource}) async {
    if (selectedSource != null) {
      await getRecipeImage(source: selectedSource);
      if (selectedImage != null) {
        await cropRecipeImage();
      }
    }
  }

  Future<void> cropRecipeImage() async {
    _croppedImage = null;
    if (_selectedImage == null) return;
    final result = await cropImageUseCase.call(
      imageFile: _selectedImage!,
      cropAspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
    );
    result.fold(
      (fail) {
        print('fail');
      },
      (image) {
        if (image != null) {
          _croppedImage = image;
        }
      },
    );
  }

  Future<String> getImageUrl({required File? croppedImageFile}) async {
    var imageUrl =
        'https://firebasestorage.googleapis.com/v0/b/flutter-recipe-app-af800.appspot.com/o/YUMMY.png?alt=media&token=d151d7da-aa1b-48d7-a25b-92089075b3cc';
    if (croppedImageFile == null) return imageUrl;
    final response = await getImageUrlUseCase.call(imageFile: croppedImageFile);
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
    final recipeImageUrl = await getImageUrl(croppedImageFile: _croppedImage);
    final result = await shareRecipeUseCase.call(
      recipeEntity: RecipeEntity(
        postId: postId,
        userId: postId,
        recipeTitle: recipeName,
        recipeDescription: recipeDescription,
        imageUrl: recipeImageUrl,
        cookingDuration: _cookingDuration.toString(),
        recipeIngredients: _ingredients,
        sharedTime: DateTime.now().toUtc(),
        worldKitchen: _worldKitchen,
        cookingType: _cookingType,
        recipeStepIds: stepIds,
      ),
    );
    var succes = false;
    result.fold(
      (failure) {
        //internet
        // server
        // sayfa geçişlerindeki awaitlik.
        // crop design
        //reset viewmodel.
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
        final url =
            await getImageUrl(croppedImageFile: inputStep.stepImageFile);
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
    _cookingDuration = 30;
    _ingredients = [''];
    //_recipeSteps = [''];
    _croppedImage = null;
    _selectedImage = null;
    _cookingType = '';
    _worldKitchen = '';
    // imageUrl = null;
    notifyListeners();
  }

  void setCookingDuration(double value) {
    _cookingDuration = value;
    notifyListeners();
  }
}
