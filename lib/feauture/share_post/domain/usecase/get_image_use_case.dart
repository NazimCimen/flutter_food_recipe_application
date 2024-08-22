import 'dart:io';

import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';
import 'package:flutter_food_recipe_application/feauture/share_post/domain/repository/share_post_repository.dart';
import 'package:image_picker/image_picker.dart';

class GetImageUseCase {
  final SharePostRepository repository;
  GetImageUseCase({required this.repository});
  Future<Either<Failure, File?>> call({required ImageSource source}) async {
    return repository.getImage(source);
  }
}
