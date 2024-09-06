import 'dart:io';

import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';
import 'package:flutter_food_recipe_application/feauture/image_management/domain/repository/image_managemenT_repository.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/domain/repository/share_recipe_repository.dart';
import 'package:image_picker/image_picker.dart';

class GetImageFileUseCase {
  final ImageManagementRepository repository;
  GetImageFileUseCase({required this.repository});
  Future<Either<Failure, File?>> call({required ImageSource source}) async {
    return repository.getImage(source);
  }
}
