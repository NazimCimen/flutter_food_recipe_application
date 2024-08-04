import 'package:dio/dio.dart';
import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';
import 'package:flutter_food_recipe_application/feauture/splash/splash_export.dart';

final serviceLocator = GetIt.instance;

void setupLocator() {
  serviceLocator
    ..registerSingletonAsync<SharedPreferences>(
      () async => SharedPreferences.getInstance(),
    )
    ..registerLazySingleton<Connectivity>(() => Connectivity())
    ..registerLazySingleton<INetworkInfo>(
      () => NetworkInfo(serviceLocator<Connectivity>()),
    )
    ..registerLazySingleton<IThemeManager>(() => ThemeManager())
    ..registerLazySingleton<Dio>(() => Dio())
    ..registerLazySingleton<IErrorMapper>(
      () => ErrorMapper(),
    )
    ..registerLazySingleton<OnBoardJsonPathProvider>(
      () => OnBoardJsonPathProviderImpl(),
    )
    ..registerLazySingleton<OnBoardLocalDataSource>(
      () => OnBoardLocalDataSourceImpl(
        serviceLocator<SharedPreferences>(),
        serviceLocator<OnBoardJsonPathProvider>(),
      ),
    )
    ..registerLazySingleton<GetOnBoardDatasUseCase>(
      () => GetOnBoardDatasUseCase(serviceLocator<OnBoardRepository>()),
    )
    ..registerLazySingleton<OnboardViewModel>(
      () => OnboardViewModel(
        getOnBoardDatasUseCase: serviceLocator(),
        setOnBoardShownUseCase: serviceLocator(),
      ),
    )
    ..registerLazySingleton<OnBoardRepository>(
      () => OnBoardRepositoryImpl(
        localDataSource: serviceLocator<OnBoardLocalDataSource>(),
      ),
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
    )
    ..registerLazySingleton<FirebaseAuth>(
      () => FirebaseAuth.instance,
    )
    ..registerLazySingleton<GoogleSignIn>(
      () => GoogleSignIn(),
    )
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        auth: serviceLocator<FirebaseAuth>(),
        googleSignIn: serviceLocator<GoogleSignIn>(),
        networkInfo: serviceLocator<INetworkInfo>(),
        errorMapper: serviceLocator<IErrorMapper>(),
      ),
    )
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        remoteDataSource: serviceLocator<AuthRemoteDataSource>(),
      ),
    )
    ..registerLazySingleton<SignupUserUseCase>(
      () => SignupUserUseCase(serviceLocator<AuthRepository>()),
    )
    ..registerLazySingleton<SigninUserUseCase>(
      () => SigninUserUseCase(serviceLocator<AuthRepository>()),
    )
    ..registerLazySingleton<SigninWithAppleUserUseCase>(
      () => SigninWithAppleUserUseCase(serviceLocator<AuthRepository>()),
    )
    ..registerLazySingleton(
      () => SigninWithGoogleUserUseCase(serviceLocator<AuthRepository>()),
    )
    ..registerLazySingleton<AuthViewModel>(
      () => AuthViewModel(
        signinUserUseCase: serviceLocator<SigninUserUseCase>(),
        signupUserUseCase: serviceLocator<SignupUserUseCase>(),
        signinWithAppleUserUseCase:
            serviceLocator<SigninWithAppleUserUseCase>(),
        signinWithGoogleUserUseCase:
            serviceLocator<SigninWithGoogleUserUseCase>(),
      ),
    );
}
