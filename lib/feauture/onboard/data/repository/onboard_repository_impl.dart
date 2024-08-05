import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';

class OnBoardRepositoryImpl implements OnBoardRepository {
  final OnBoardLocalDataSource localDataSource;
  OnBoardRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<OnBoardModel>>> getOnBoardDatas({
    required Locale locale,
  }) async {
    try {
      final onboardDatas = await localDataSource.getOnBoardData(locale: locale);
      return Right(onboardDatas);
    } on CacheException {
      return Left(CacheFailure(errorMessage: ''));
    }
  }

  @override
  Future<void> setOnBoardShown() async {
    await localDataSource.setOnBoardShown();
  }
}
