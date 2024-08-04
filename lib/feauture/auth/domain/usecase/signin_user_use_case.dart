import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';

class SigninUserUseCase {
  final AuthRepository repository;
  SigninUserUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call({
    required UserSigninInputModel signInInputModel,
  }) async {
    return repository.signinUser(signinInputModel: signInInputModel);
  }
}
