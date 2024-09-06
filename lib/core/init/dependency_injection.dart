import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';
import 'package:flutter_food_recipe_application/feauture/home/data/data_source/home_remote_data_source.dart';
import 'package:flutter_food_recipe_application/feauture/home/data/repository/home_repository_impl.dart';
import 'package:flutter_food_recipe_application/feauture/home/domain/repository/home_repository.dart';
import 'package:flutter_food_recipe_application/feauture/home/domain/usecase/get_recipes_followers_use_case.dart';
import 'package:flutter_food_recipe_application/feauture/home/presentation/viewmodel/home_view_model.dart';
import 'package:flutter_food_recipe_application/feauture/image_management/data/data_source/image_management_local_data_source.dart';
import 'package:flutter_food_recipe_application/feauture/image_management/data/data_source/image_management_remote_data_source.dart';
import 'package:flutter_food_recipe_application/feauture/image_management/data/repository/image_management_repository_impl.dart';
import 'package:flutter_food_recipe_application/feauture/image_management/domain/repository/image_management_repository.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/data/data_source/share_recipe_remote_data_source.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/data/repository/share_recipe_repository_impl.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/domain/repository/share_recipe_repository.dart';
import 'package:flutter_food_recipe_application/feauture/image_management/domain/usecase/crop_image_use_case.dart';
import 'package:flutter_food_recipe_application/feauture/image_management/domain/usecase/get_image_url_use_case.dart';
import 'package:flutter_food_recipe_application/feauture/image_management/domain/usecase/get_image_file_use_case.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/domain/usecase/share_recipe_steps_use_case.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/domain/usecase/share_recipe_use_case.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/viewmodel/share_recipe_view_model.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/model/recipe_model.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/model/recipe_step_model.dart';
import 'package:flutter_food_recipe_application/feauture/splash/splash_export.dart';
import 'package:flutter_food_recipe_application/product/firebase/firebase_converter.dart';

final serviceLocator = GetIt.instance;
void setupLocator() {
  serviceLocator
    ..registerLazySingleton<FirebaseAuth>(
      () => FirebaseAuth.instance,
    )
    ..registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance,
    )
    ..registerLazySingleton<FirebaseStorage>(
      () => FirebaseStorage.instance,
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
    ..registerLazySingleton<GetAppDatabaseVersionNumberUseCase>(
      () => GetAppDatabaseVersionNumberUseCase(
          serviceLocator<SplashRepository>()),
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
        serviceLocator<GetAppDatabaseVersionNumberUseCase>(),
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
        auth: serviceLocator<FirebaseAuth>(),
      ),
    )
    ..registerLazySingleton<RecipeModel>(
      () => const RecipeModel(),
    )
    ..registerLazySingleton<RecipeStepModel>(
      () => const RecipeStepModel(),
    )
    ..registerLazySingleton<FirebaseConverter<RecipeModel>>(
      () => FirebaseConverter<RecipeModel>(
        model: serviceLocator<RecipeModel>(),
        firestore: serviceLocator<FirebaseFirestore>(),
      ),
    )
    ..registerLazySingleton<FirebaseConverter<RecipeStepModel>>(
      () => FirebaseConverter<RecipeStepModel>(
        model: serviceLocator<RecipeStepModel>(),
        firestore: serviceLocator<FirebaseFirestore>(),
      ),
    )
    ..registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(
        firebaseConverter: serviceLocator<FirebaseConverter<RecipeModel>>(),
      ),
    )
    ..registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(
        serviceLocator<INetworkInfo>(),
        serviceLocator<HomeRemoteDataSource>(),
      ),
    )
    ..registerLazySingleton<GetRecipesFollowersUseCase>(
      () => GetRecipesFollowersUseCase(serviceLocator<HomeRepository>()),
    )
    ..registerLazySingleton<HomeViewModel>(
      () => HomeViewModel(serviceLocator<GetRecipesFollowersUseCase>()),
    )
    ..registerLazySingleton<ImageManagementRemoteDataSource>(
      () => ImageManagementRemoteDataSourceImpl(
        storage: serviceLocator<FirebaseStorage>(),
      ),
    )
    ..registerLazySingleton<ImageManagementLocalDataSource>(
      () => ImageManagementLocalDataSourceImpl(),
    )
    ..registerLazySingleton<ImageManagementRepository>(
      () => ImageManagementRepositoryImpl(
        remoteDataSource: serviceLocator<ImageManagementRemoteDataSource>(),
        connectivity: serviceLocator<INetworkInfo>(),
        localDataSource: serviceLocator<ImageManagementLocalDataSource>(),
      ),
    )
    ..registerLazySingleton<GetImageFileUseCase>(
      () => GetImageFileUseCase(
        repository: serviceLocator<ImageManagementRepository>(),
      ),
    )
    ..registerLazySingleton<CropImageUseCase>(
      () => CropImageUseCase(
          repository: serviceLocator<ImageManagementRepository>()),
    )
    ..registerLazySingleton<GetImageUrlUseCase>(
      () => GetImageUrlUseCase(
          repository: serviceLocator<ImageManagementRepository>()),
    )
    ..registerLazySingleton<ShareRecipeRemoteDataSource>(
      () => ShareRecipeRemoteDataSourceImpl(
        storage: serviceLocator<FirebaseStorage>(),
        firestore: serviceLocator<FirebaseFirestore>(),
        recipeFirebaseConverter:
            serviceLocator<FirebaseConverter<RecipeModel>>(),
        stepFirebaseConverter:
            serviceLocator<FirebaseConverter<RecipeStepModel>>(),
      ),
    )
    ..registerLazySingleton<ShareRecipeRepository>(
      () => ShareRecipeRepositoryImpl(
        remoteDataSource: serviceLocator<ShareRecipeRemoteDataSource>(),
        connectivity: serviceLocator<INetworkInfo>(),
      ),
    )
    ..registerLazySingleton<ShareRecipeUseCase>(
      () => ShareRecipeUseCase(
          repository: serviceLocator<ShareRecipeRepository>()),
    )
    ..registerLazySingleton<ShareRecipeStepsUseCase>(
      () => ShareRecipeStepsUseCase(
        serviceLocator<ShareRecipeRepository>(),
      ),
    )
    ..registerLazySingleton<ShareRecipeViewModel>(
      () => ShareRecipeViewModel(
        getImageUseCase: serviceLocator<GetImageFileUseCase>(),
        cropImageUseCase: serviceLocator<CropImageUseCase>(),
        getImageUrlUseCase: serviceLocator<GetImageUrlUseCase>(),
        shareRecipeUseCase: serviceLocator<ShareRecipeUseCase>(),
        shareRecipeStepsUseCase: serviceLocator<ShareRecipeStepsUseCase>(),
      ),
    );
}
