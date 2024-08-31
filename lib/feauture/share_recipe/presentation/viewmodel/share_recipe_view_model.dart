import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/domain/usecase/get_image_url_use_case.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/domain/usecase/share_recipe_use_case.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/logic/input_page4_logic.dart';
import 'package:flutter_food_recipe_application/product/models/recipe_step_input_model.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/entity/recipe_entity.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/domain/usecase/crop_image_use_case.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/domain/usecase/get_image_use_case.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/entity/recipe_step_entity.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class ShareRecipeViewModel extends ChangeNotifier {
  final GetImageUseCase getImageUseCase;
  final CropImageUseCase cropImageUseCase;
  final GetImageUrlUseCase getImageUrlUseCase;
  final ShareRecipeUseCase shareRecipeUseCase;
  final InputPage4Logic logic;
  ShareRecipeViewModel({
    required this.getImageUseCase,
    required this.cropImageUseCase,
    required this.getImageUrlUseCase,
    required this.logic,
    required this.shareRecipeUseCase,
  });

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void changeLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  void valueSetterCookingType(String value) {
    _cookingType = value;
  }

  void valueSetterWorldKitchen(String value) {
    _worldKitchen = value;
  }

  double _cookingDuration = 30;
  double get cookingDuration => _cookingDuration;

  String _cookingType = '';
  String get cookingType => _cookingType;

  String _worldKitchen = '';
  String get worldKitchen => _worldKitchen;

  List<String> _ingredients = [''];
  List<String> get ingredients => _ingredients;

  File? _croppedImage;
  File? get croppedImage => _croppedImage;

  File? _selectedImage;
  File? get selectedImage => _selectedImage;

  String? imageUrl;

  // List<RecipeStepEntity> _recipeSteps = [];
  // List<RecipeStepEntity> get recipeSteps => _recipeSteps;
// İlk adımı eklemek için kullanılır
  void createInitialStep({required RecipeStepEntity step}) {
    logic.addStep(recipeStep: step);
  }

  // Yeni bir adım eklemek için
  void addNewRecipeStep({required RecipeStepEntity step}) {
    logic.addStep(recipeStep: step);
    notifyListeners();
  }

  // Adım kaldırmak için (artık index yerine model kullanıyoruz)
  void removeRecipeStep(RecipeStepInputModel stepModel) {
    logic.removeStep(stepModel.stepEntity);
    notifyListeners();
  }

  // Mevcut adımın geçerli olup olmadığını kontrol eder
  bool isCurrentStepValid() {
    return logic.isCurrentStepValid();
  }

  // Adımın açıklamasını güncellemek için
  void updateRecipeStep(RecipeStepInputModel stepModel, String description) {
    logic.updateRecipeStep(stepModel.stepEntity, description);
    notifyListeners();
  }

  // Verilen adım modeline odaklanmak için (FocusNode döndürür)
  FocusNode getFocusNodeForStep(RecipeStepInputModel stepModel) {
    return stepModel.focusNode;
  }

  // Verilen adım modeline ait controller döndürür
  TextEditingController getControllerForStep(RecipeStepInputModel stepModel) {
    return stepModel.controller;
  }

  // Sayfa kapanırken tüm controller ve node'ları dispose etmek için
  void disposeStepPage() {
    logic.dispose();
  }

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
    final result = await cropImageUseCase.call(source: _selectedImage!);
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

  Future<void> getImageUrl() async {
    if (croppedImage == null) return;
    final response = await getImageUrlUseCase.call(imageFile: croppedImage!);
    response.fold(
      (failure) {},
      (url) {
        imageUrl = url;
      },
    );
  }

  Future<bool> shareRecipe({
    required String recipeTitle,
    required String recipeDescription,
  }) async {
    final postId = const Uuid().v1();
    final result = await shareRecipeUseCase.call(
      /// emphty validate FIX... worldKitchen cookingType and all
      recipeEntity: RecipeEntity(
        postId: postId,
        userId: postId,
        recipeTitle: recipeTitle,
        recipeDescription: recipeDescription,
        imageUrl: imageUrl,
        cookingDuration: _cookingDuration.toString(),
        recipeIngredients: _ingredients,
        sharedTime: DateTime.now().toUtc(),
        worldKitchen: _worldKitchen,
        cookingType: _cookingType,
      ),
    );
    var succes = false;
    result.fold(
      (failure) {
        succes = true;

        ///FIX IMPORTANT RESULT FOLD POST FAIL
      },
      (result) {
        succes = result;
      },
    );
    return succes;

    ///SERACH UTC IS GLOBAL UTC 3 2 .. IMPORTANTTTTTTTTTT
  }

  void reset() {
    _cookingDuration = 30;
    _ingredients = [''];
    //_recipeSteps = [''];
    _croppedImage = null;
    _selectedImage = null;
    _cookingType = '';
    _worldKitchen = '';
    imageUrl = null;
    notifyListeners();
  }

  void setCookingDuration(double value) {
    _cookingDuration = value;
    notifyListeners();
  }
}
