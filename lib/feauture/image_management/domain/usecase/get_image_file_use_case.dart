import 'dart:io';
import 'package:flutter_food_recipe_application/feauture/image_management/image_management_export.dart';

class GetImageFileUseCase {
  final ImageManagementRepository repository;
  GetImageFileUseCase({required this.repository});
  Future<Either<Failure, File?>> call({required ImageSource source}) async {
    return repository.getImage(source);
  }
}
