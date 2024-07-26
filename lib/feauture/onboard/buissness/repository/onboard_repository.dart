import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';

abstract class OnBoardRepository {
  Future<Either<Failure, List<OnBoardEntity>>> getOnBoardDatas(
      {required Locale locale});
}
