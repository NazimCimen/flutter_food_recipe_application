import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/business/usecases/set_onboard_shown_usecase.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/data/data_source/local/onboard_local_data_source.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';
import 'package:flutter_food_recipe_application/feauture/splash/business/repository/splash_repository.dart';
import 'package:flutter_food_recipe_application/feauture/splash/business/usecase/check_cache_onboard_shown_use_case.dart';
import 'package:flutter_food_recipe_application/feauture/splash/data/data_source/splash_local_data_source.dart';
import 'package:flutter_food_recipe_application/feauture/splash/data/repository/splash_repository_impl.dart';
import 'package:flutter_food_recipe_application/feauture/splash/presentation/viewmodel/splash_view_model.dart';

final sl = GetIt.instance;
void setupLocator() {
  sl
    ..registerSingletonAsync<SharedPreferences>(
      () async => SharedPreferences.getInstance(),
    )
    ..registerLazySingleton<INetworkInfo>(() => NetworkInfo(sl<Connectivity>()))
    ..registerLazySingleton<IThemeManager>(() => ThemeManager())
    ..registerLazySingleton<Dio>(() => Dio())
    ..registerLazySingleton<OnBoardJsonPathProvider>(
      () => OnBoardJsonPathProviderImpl(),
    )
    ..registerLazySingleton<OnBoardLocalDataSource>(
      () => OnBoardLocalDataSourceImpl(
          sl<SharedPreferences>(), sl<OnBoardJsonPathProvider>()),
    )
    ..registerLazySingleton<GetOnBoardDatasUseCase>(
      () => GetOnBoardDatasUseCase(sl<OnBoardRepository>()),
    )
    ..registerLazySingleton<OnboardViewModel>(
      () => OnboardViewModel(
          getOnBoardDatasUseCase: sl(), setOnBoardShownUseCase: sl()),
    )
    ..registerLazySingleton<OnBoardRepository>(
      () =>
          OnBoardRepositoryImpl(localDataSource: sl<OnBoardLocalDataSource>()),
    )
    ..registerLazySingleton<SetOnBoardShownUseCase>(
      () => SetOnBoardShownUseCase(sl<OnBoardRepository>()),
    )
    ..registerLazySingleton<SplashLocalDataSource>(
      () => SplashLocalDataSourceImpl(sl<SharedPreferences>()),
    )
    ..registerLazySingleton<SplashRepository>(
      () => SplashRepositoryImpl(sl<SplashLocalDataSource>()),
    )
    ..registerLazySingleton<CheckCacheOnboardShownUseCase>(
      () => CheckCacheOnboardShownUseCase(sl<SplashRepository>()),
    )
    ..registerLazySingleton<SplashViewModel>(
      () => SplashViewModel(sl<CheckCacheOnboardShownUseCase>()),
    );
}
