import 'package:dartz/dartz.dart';
import 'package:flutter_food_recipe_application/core/error/exception.dart';
import 'package:flutter_food_recipe_application/core/error/failure.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/buissness/entities/onboard_entity.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/buissness/repository/onboard_repository.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/data/data_sources/onboard_local_data_source.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/data/data_sources/onboard_remote_data_source.dart';

class OnBoardRepositoryImpl implements OnBoardRepository {
  final OnBoardLocalDataSource localDataSource;
  OnBoardRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<OnBoardEntity>>> getOnBoardDatas() async {
    try {
      final onboardDatas = localDataSource.getOnBoardData();
      return Right(onboardDatas);
    } on ServerException {
      return Left(CacheFailure(errorMessage: 'errorMessage'));
    }
  }
}
