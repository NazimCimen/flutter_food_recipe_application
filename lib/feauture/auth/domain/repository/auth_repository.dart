import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signinUser({
    required UserSigninInputModel signinInputModel,
  });
  Future<Either<Failure, UserEntity>> signupUser({
    required UserSignUpInputModel signUpInputModel,
  });
  Future<Either<Failure, UserEntity>> signinWithGoogleUser();
  Future<Either<Failure, UserEntity>> signinWithAppleUser();
}
