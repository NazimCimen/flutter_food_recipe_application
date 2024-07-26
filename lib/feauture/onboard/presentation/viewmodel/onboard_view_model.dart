import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/error/failure.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/buissness/entities/onboard_entity.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/buissness/usecases/get_onboard_datas.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/data/data_sources/onboard_local_data_source.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/data/data_sources/onboard_remote_data_source.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/data/repository/onboard_repository_impl.dart';

class OnboardViewModel extends ChangeNotifier {
  OnboardViewModel({this.failure, this.onBoardDatas});

  List<OnBoardEntity?>? onBoardDatas;
  Failure? failure;

  Future<void> eitherFailureOrOnBoardDatas() async {
    final repository =
        OnBoardRepositoryImpl(localDataSource: OnBoardLocalDataSourceImpl());
    final failureOrOnboard = await GetOnBoardDatas(repository).call();

    failureOrOnboard.fold((failure) {
      this.failure = failure;
      notifyListeners();
    }, (onboardDatas) {
      onBoardDatas = onboardDatas;
      notifyListeners();
    });
  }
}
