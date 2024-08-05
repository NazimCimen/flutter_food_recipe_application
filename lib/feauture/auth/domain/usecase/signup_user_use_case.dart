import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';

class SignupUserUseCase {
  final AuthRepository repository;
  SignupUserUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call({
    required UserSignUpInputModel signUpInputModel,
  }) async {
    return repository.signupUser(signUpInputModel: signUpInputModel);
  }
}
