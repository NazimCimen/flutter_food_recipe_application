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
    return remoteDataSource.signinUser(signInInputModel: signinInputModel);
  }

  /// SIGN UP - RETURN FAILURE OR USER
  @override
  Future<Either<Failure, UserEntity>> signupUser({
    required UserSignUpInputModel signUpInputModel,
  }) async {
    return remoteDataSource.signupUser(signUpInputModel: signUpInputModel);
  }

  /// SIGN IN WITH GOOGLE - RETURN FAILURE OR USER
  @override
  Future<Either<Failure, UserEntity>> signinWithGoogleUser() async {
    return remoteDataSource.signinWithGoogleUser();
  }

  /// SIGN IN WITH APPLE - RETURN FAILURE OR USER
  @override
  Future<Either<Failure, UserEntity>> signinWithAppleUser() async {
    return remoteDataSource.signinWithAppleUser();
  }
}
