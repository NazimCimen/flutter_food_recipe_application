import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';

abstract class AuthLocaleDataSource {
  Future<void> saveUserAuthToken({required String userIdToken});
}

class AuthLocaleDataSourceImpl implements AuthLocaleDataSource {
  final EncryptedCacheManager cacheManager;
  AuthLocaleDataSourceImpl({required this.cacheManager});

  /// CACHE USER AUTH TOKEN
  @override
  Future<void> saveUserAuthToken({required String userIdToken}) async {
    try {
      await cacheManager.saveData(data: userIdToken);
    } catch (e) {
      throw CacheException('data is not saved');
    }
  }
}
