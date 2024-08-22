import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';
import 'package:flutter_food_recipe_application/feauture/share_post/domain/usecase/crop_image_use_case.dart';
import 'package:flutter_food_recipe_application/feauture/share_post/domain/usecase/get_image_use_case.dart';
import 'package:image_picker/image_picker.dart';

class SharePostViewModel extends ChangeNotifier {
  final GetImageUseCase getImageUseCase;
  final CropImageUseCase cropImageUseCase;

  SharePostViewModel({
    required this.getImageUseCase,
    required this.cropImageUseCase,
  });

  double _cookingDuration = 30;
  double get cookingDuration => _cookingDuration;

  File? croppedImage;
  File? image;
  // Slider value setter
  void setCookingDuration(double value) {
    _cookingDuration = value;
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
}
