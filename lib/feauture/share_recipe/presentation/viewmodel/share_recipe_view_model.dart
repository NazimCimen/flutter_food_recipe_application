import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/domain/usecase/get_image_url_use_case.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/domain/usecase/share_recipe_use_case.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/entity/recipe_entity.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/entity/recipe_step_entity.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/domain/usecase/crop_image_use_case.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/domain/usecase/get_image_use_case.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class ShareRecipeViewModel extends ChangeNotifier {
  final GetImageUseCase getImageUseCase;
  final CropImageUseCase cropImageUseCase;
  final GetImageUrlUseCase getImageUrlUseCase;
  final ShareRecipeUseCase shareRecipeUseCase;
  ShareRecipeViewModel({
    required this.getImageUseCase,
    required this.cropImageUseCase,
    required this.getImageUrlUseCase,
    required this.shareRecipeUseCase,
  });
  int _currentPage = 0;
  int get currentPage => _currentPage;
  final int _totalPages = 4;
  int get totalPage => _totalPages;

  RecipeEntity _recipeEntity = RecipeEntity(
    postId: null,
    userId: null,
    recipeTitle: '',
    recipeDescription: '',
    imageUrl: '',
    recipeIngredients: [''],
    sharedTime: null,
    worldKitchen: '',
  );

  double _cookingDuration = 30;
  double get cookingDuration => _cookingDuration;

  List<String> _ingredients = [""];
  List<String> get ingredients => _ingredients;

  List<String> _recipeSteps = [''];
  List<String> get recipeSteps => _recipeSteps;

  File? croppedImage;
  File? image;
  String? imageUrl;

  void setCookingDuration(double value) {
    _cookingDuration = value;
    notifyListeners();
  }

  void onPageChanged(int index) {
    _currentPage = index;
    notifyListeners();
  }

  Future<void> getRecipeImage({required ImageSource source}) async {
    final result = await getImageUseCase.call(source: source);
    result.fold(
      (fail) {
        print('fail');
      },
      (image) {
        if (image != null) {
          this.image = image;
          notifyListeners();
        }
      },
    );
  }

  Future<void> cropRecipeImage() async {
    if (image == null) return;
    final result = await cropImageUseCase.call(source: image!);
    result.fold(
      (fail) {
        print('fail');
      },
      (image) {
        if (image != null) {
          croppedImage = image;
        }
        notifyListeners();
      },
    );
  }

  Future<void> getImageUrl() async {
    if (croppedImage == null) return;
    final response = await getImageUrlUseCase.call(imageFile: croppedImage!);
  }
//      String postId = const Uuid().v1().toString();

  // RecipeEntity recipeEntity;
  //RecipeStepEntity recipeStepEntity;
  Future<void> shareRecipe({
    required String recipeTitle,
    required String recipeDescription,
    required String worldKitchen,
    required String cookingType,
  }
      //img                String
      //title              String
      //desc               String
      //cookin duration    String
      //cooking type       String
      //ingredients        List<String>
      // recipe steps      List<RecipeStepModel>
      ) async {
    await getImageUrl();
    final postId = const Uuid().v1().toString();
    // if imageUrl != null

    final result = await shareRecipeUseCase.call(
      recipeEntity: RecipeEntity(
        postId: postId,
        userId: postId,
        recipeTitle: recipeTitle,
        recipeDescription: recipeDescription,
        imageUrl: imageUrl,
        recipeIngredients: _ingredients,
        sharedTime: DateTime.now().toUtc(),
        worldKitchen: worldKitchen,
      ),
    );
    /*  recipeEntity.recipeIngredients;
    recipeEntity.imageUrl;
    recipeEntity.recipeDescription;
    recipeEntity.recipeTitle;
    recipeEntity.worldKitchen;
    recipeEntity.recipeStepIds;

    recipeStepEntity*/
  }
}
