import 'package:flutter_food_recipe_application/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/buissness/entities/onboard_entity.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/buissness/repository/onboard_repository.dart';

class GetOnBoardDatas {
  final OnBoardRepository repository;
  GetOnBoardDatas(this.repository);
  Future<Either<Failure, List<OnBoardEntity>>> call() async {
    return await repository.getOnBoardDatas();
  }
}
