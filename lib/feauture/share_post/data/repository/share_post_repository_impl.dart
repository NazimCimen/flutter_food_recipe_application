import 'dart:io';

import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';
import 'package:flutter_food_recipe_application/feauture/share_post/data/data_source/local/share_post_local_data_source.dart';
import 'package:flutter_food_recipe_application/feauture/share_post/domain/repository/share_post_repository.dart';
import 'package:image_picker/image_picker.dart';

class SharePostRepositoryImpl extends SharePostRepository {
  final SharePostLocalDataSource localeDataSource;
  final INetworkInfo connectivity;
  SharePostRepositoryImpl({
    required this.localeDataSource,
    required this.connectivity,
  });
  @override
  Future<Either<Failure, File?>> getImage(ImageSource source) async {
    final result = await localeDataSource.getImage(source);
    return result;
  }

  @override
  Future<Either<Failure, File?>> cropImage(File imageFile) async {
    final result = await localeDataSource.cropImage(imageFile);
    return result;
  }
}
