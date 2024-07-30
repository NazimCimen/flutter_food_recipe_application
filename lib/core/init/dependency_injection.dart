import 'package:dio/dio.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';
import 'package:flutter_food_recipe_application/feauture/splash/splash_export.dart';

final serviceLocator = GetIt.instance;
void setupLocator() {
  serviceLocator
    ..registerSingletonAsync<SharedPreferences>(
      () async => SharedPreferences.getInstance(),
    )
    ..registerLazySingleton<INetworkInfo>(
        () => NetworkInfo(serviceLocator<Connectivity>()))
    ..registerLazySingleton<IThemeManager>(() => ThemeManager())
    ..registerLazySingleton<Dio>(() => Dio())
    ..registerLazySingleton<OnBoardJsonPathProvider>(
      () => OnBoardJsonPathProviderImpl(),
    )
    ..registerLazySingleton<OnBoardLocalDataSource>(
      () => OnBoardLocalDataSourceImpl(serviceLocator<SharedPreferences>(),
          serviceLocator<OnBoardJsonPathProvider>()),
    )
    ..registerLazySingleton<GetOnBoardDatasUseCase>(
      () => GetOnBoardDatasUseCase(serviceLocator<OnBoardRepository>()),
    )
    ..registerLazySingleton<OnboardViewModel>(
      () => OnboardViewModel(
          getOnBoardDatasUseCase: serviceLocator(),
          setOnBoardShownUseCase: serviceLocator()),
    )
    ..registerLazySingleton<OnBoardRepository>(
      () => OnBoardRepositoryImpl(
          localDataSource: serviceLocator<OnBoardLocalDataSource>()),
    )
    ..registerLazySingleton<SetOnBoardShownUseCase>(
      () => SetOnBoardShownUseCase(serviceLocator<OnBoardRepository>()),
    )
    ..registerLazySingleton<SplashLocalDataSource>(
      () => SplashLocalDataSourceImpl(serviceLocator<SharedPreferences>()),
    )
    ..registerLazySingleton<SplashRepository>(
      () => SplashRepositoryImpl(serviceLocator<SplashLocalDataSource>()),
    )
    ..registerLazySingleton<CheckCacheOnboardShownUseCase>(
      () => CheckCacheOnboardShownUseCase(serviceLocator<SplashRepository>()),
    )
    ..registerLazySingleton<SplashViewModel>(
      () => SplashViewModel(serviceLocator<CheckCacheOnboardShownUseCase>()),
    );
}
