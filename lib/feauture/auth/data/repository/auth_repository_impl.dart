import 'package:flutter/foundation.dart';
import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';
import 'package:flutter_food_recipe_application/feauture/auth/data/data_source/auth_locale_data_source.dart';

@immutable
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocaleDataSource localeDataSource;

  const AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localeDataSource,
  });

  /// SIGN IN - RETURN FAILURE OR USER
  @override
  Future<Either<Failure, UserEntity>> signinUser({
    required UserSigninInputModel signinInputModel,
  }) async {
    final result =
        await remoteDataSource.signinUser(signInInputModel: signinInputModel);
    return result.fold(
      (failure) => Left(failure),
      (userModel) => Right(userModel.toEntity()),
    );
  }

  /// SIGN UP - RETURN FAILURE OR USER
  @override
  Future<Either<Failure, UserEntity>> signupUser({
    required UserSignUpInputModel signUpInputModel,
  }) async {
    final result =
        await remoteDataSource.signupUser(signUpInputModel: signUpInputModel);
    return result.fold(
      (failure) => Left(failure),
      (userModel) => Right(userModel.toEntity()),
    );
  }

  /// SIGN IN WITH GOOGLE - RETURN FAILURE OR USER
  @override
  Future<Either<Failure, UserEntity>> signinWithGoogleUser() async {
    final result = await remoteDataSource.signinWithGoogleUser();
    return result.fold(
      (failure) => Left(failure),
      (userModel) => Right(userModel.toEntity()),
    );
  }

  /// SIGN IN WITH APPLE - RETURN FAILURE OR USER
  @override
  Future<Either<Failure, UserEntity>> signinWithAppleUser() async {
    final result = await remoteDataSource.signinWithAppleUser();
    return result.fold(
      (failure) => Left(failure),
      (userModel) => Right(userModel.toEntity()),
    );
  }

  @override
  Future<void> cacheUserToken({required String userIdToken}) async {
    await localeDataSource.saveUserAuthToken(userIdToken: userIdToken);
  }
}
