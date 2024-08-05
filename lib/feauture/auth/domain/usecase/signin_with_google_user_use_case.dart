import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';

class SigninWithGoogleUserUseCase {
  final AuthRepository repository;

  SigninWithGoogleUserUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call() async {
    return repository.signinWithGoogleUser();
  }
}
