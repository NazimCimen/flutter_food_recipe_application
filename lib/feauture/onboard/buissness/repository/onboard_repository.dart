import 'package:dartz/dartz.dart';
import 'package:flutter_food_recipe_application/core/error/failure.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/buissness/entities/onboard_entity.dart';

abstract class OnBoardRepository {
  Future<Either<Failure, List<OnBoardEntity>>> getOnBoardDatas();
}
