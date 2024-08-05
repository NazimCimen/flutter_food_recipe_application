import 'package:flutter/foundation.dart';
import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';

@immutable
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  const AuthRepositoryImpl({
    required this.remoteDataSource,
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
}
