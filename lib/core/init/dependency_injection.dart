import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/data/data_sources/local/onboard_local_data_source.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';

final sl = GetIt.instance;
void setupLocator() {
  sl
    ..registerLazySingleton<INetworkInfo>(() => NetworkInfo(sl<Connectivity>()))
    ..registerLazySingleton<IThemeManager>(() => ThemeManager())
    ..registerLazySingleton<Dio>(() => Dio())
    ..registerLazySingleton<OnBoardLocalDataSource>(
      () => OnBoardLocalDataSourceImpl(),
    )
    ..registerLazySingleton<GetOnBoardDatas>(
      () => GetOnBoardDatas(sl<OnBoardRepository>()),
    )
    ..registerLazySingleton<OnboardViewModel>(
      () => OnboardViewModel(),
    )
    ..registerLazySingleton<OnBoardRepository>(
      () =>
          OnBoardRepositoryImpl(localDataSource: sl<OnBoardLocalDataSource>()),
    );
}
