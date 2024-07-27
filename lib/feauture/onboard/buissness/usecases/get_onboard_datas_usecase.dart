import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';

class GetOnBoardDatasUseCase {
  final OnBoardRepository repository;
  GetOnBoardDatasUseCase(this.repository);
  Future<Either<Failure, List<OnBoardEntity>>> call({
    required Locale locale,
  }) async {
    return repository.getOnBoardDatas(locale: locale);
  }
}
