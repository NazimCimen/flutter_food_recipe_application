import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';

class CacheUserTokenUseCase {
  final AuthRepository repository;
  CacheUserTokenUseCase(this.repository);
  Future<void> call({required String userIdToken}) async {
    await repository.cacheUserToken(userIdToken: userIdToken);
  }
}
