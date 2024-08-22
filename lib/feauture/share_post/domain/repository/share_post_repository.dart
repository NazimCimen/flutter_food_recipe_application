import 'dart:io';

import 'package:flutter_food_recipe_application/core/app_core_export.dart';
import 'package:image_picker/image_picker.dart';

abstract class SharePostRepository {
  Future<Either<Failure, File?>> getImage(ImageSource source);
  Future<Either<Failure, File?>> cropImage(File imageFile);
}
