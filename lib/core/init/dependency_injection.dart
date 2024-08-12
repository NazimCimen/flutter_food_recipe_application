import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';
import 'package:flutter_food_recipe_application/feauture/auth/data/data_source/auth_locale_data_source.dart';
import 'package:flutter_food_recipe_application/feauture/auth/domain/usecase/cache_user_token_use_case.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';
import 'package:flutter_food_recipe_application/feauture/splash/splash_export.dart';

final serviceLocator = GetIt.instance;
void setupLocator() {
  serviceLocator
    ..registerLazySingleton<FirebaseAuth>(
      () => FirebaseAuth.instance,
    )
    ..registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance,
    )
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
    ..registerLazySingleton<AppVersionManager>(
      () => AppVersionManagerImpl(),
    )
    ..registerLazySingleton<SetOnBoardShownUseCase>(
      () => SetOnBoardShownUseCase(serviceLocator<OnBoardRepository>()),
    )
    ..registerLazySingleton<GetAppDatabaseVersionNumber>(
      () => GetAppDatabaseVersionNumber(serviceLocator<SplashRepository>()),
    )
    ..registerLazySingleton<SplashLocalDataSource>(
      () => SplashLocalDataSourceImpl(serviceLocator<SharedPreferences>()),
    )
    ..registerLazySingleton<SplashRemoteDataSource>(
      () => SplashRemoteDataSourceImpl(
        serviceLocator<FirebaseFirestore>(),
        serviceLocator<INetworkInfo>(),
      ),
    )
    ..registerLazySingleton<SplashRepository>(
      () => SplashRepositoryImpl(
        serviceLocator<SplashLocalDataSource>(),
        serviceLocator<SplashRemoteDataSource>(),
      ),
    )
    ..registerLazySingleton<CheckCacheOnboardShownUseCase>(
      () => CheckCacheOnboardShownUseCase(serviceLocator<SplashRepository>()),
    )
    ..registerLazySingleton<SplashViewModel>(
      () => SplashViewModel(
        serviceLocator<CheckCacheOnboardShownUseCase>(),
        serviceLocator<GetAppDatabaseVersionNumber>(),
        serviceLocator<AppVersionManager>(),
      ),
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
    ..registerLazySingleton<SecureEncryptionKeyManager>(
      () => SecureEncryptionKeyManager(),
    )
    ..registerLazySingleton<BaseEncryptionService>(
      () => AESEncryptionService(
        serviceLocator<SecureEncryptionKeyManager>(),
      ),
    )
    ..registerLazySingleton<EncryptedCacheManager>(
      () => EncryptedCacheManager(
        boxName: CacheHiveBoxEnum.authBox.name,
        keyName: CacheKeyEnum.authToken.name,
        encryptionService: serviceLocator<BaseEncryptionService>(),
      ),
    )
    ..registerLazySingleton<AuthLocaleDataSource>(
      () => AuthLocaleDataSourceImpl(
        cacheManager: serviceLocator<EncryptedCacheManager>(),
      ),
    )
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        remoteDataSource: serviceLocator<AuthRemoteDataSource>(),
        localeDataSource: serviceLocator<AuthLocaleDataSource>(),
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
    ..registerLazySingleton<CacheUserTokenUseCase>(
      () => CacheUserTokenUseCase(serviceLocator<AuthRepository>()),
    )
    ..registerLazySingleton<AuthViewModel>(
      () => AuthViewModel(
        signinUserUseCase: serviceLocator<SigninUserUseCase>(),
        signupUserUseCase: serviceLocator<SignupUserUseCase>(),
        signinWithAppleUserUseCase:
            serviceLocator<SigninWithAppleUserUseCase>(),
        signinWithGoogleUserUseCase:
            serviceLocator<SigninWithGoogleUserUseCase>(),
        cacheUserTokenUseCase: serviceLocator<CacheUserTokenUseCase>(),
      ),
    );
}
