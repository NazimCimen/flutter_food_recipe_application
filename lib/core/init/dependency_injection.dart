import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/buissness/usecases/set_onboard_shown_usecase.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/data/data_sources/local/onboard_local_data_source.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';

final sl = GetIt.instance;
void setupLocator() {
  sl
    ..registerSingletonAsync<SharedPreferences>(
      () async => SharedPreferences.getInstance(),
    )
    ..registerLazySingleton<INetworkInfo>(() => NetworkInfo(sl<Connectivity>()))
    ..registerLazySingleton<IThemeManager>(() => ThemeManager())
    ..registerLazySingleton<Dio>(() => Dio())
    ..registerLazySingleton<OnBoardLocalDataSource>(
      () => OnBoardLocalDataSourceImpl(sl<SharedPreferences>()),
    )
    ..registerLazySingleton<GetOnBoardDatasUseCase>(
      () => GetOnBoardDatasUseCase(sl<OnBoardRepository>()),
    )
    ..registerLazySingleton<OnboardViewModel>(
      () =>
          OnboardViewModel(getOnBoardDatas: sl(), setOnBoardShownUseCase: sl()),
    )
    ..registerLazySingleton<OnBoardRepository>(
      () =>
          OnBoardRepositoryImpl(localDataSource: sl<OnBoardLocalDataSource>()),
    )
    ..registerLazySingleton<SetOnBoardShownUseCase>(
      () => SetOnBoardShownUseCase(sl<OnBoardRepository>()),
    );
}
