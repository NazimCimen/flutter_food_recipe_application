import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';

class SigninWithAppleUserUseCase {
  final AuthRepository repository;

  SigninWithAppleUserUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call() async {
    return repository.signinWithAppleUser();
  }
}
