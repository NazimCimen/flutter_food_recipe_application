import 'package:flutter_food_recipe_application/core/cache/cache_manager/base_cache_manager.dart';
import 'package:flutter_food_recipe_application/core/cache/cache_manager/encrypted_cache_manager.dart';
import 'package:flutter_food_recipe_application/core/error/exception.dart';

abstract class AuthLocaleDataSource {
  Future<void> saveUserAuthToken({required String userIdToken});
}

class AuthLocaleDataSourceImpl implements AuthLocaleDataSource {
  final EncryptedCacheManager cacheManager;
  AuthLocaleDataSourceImpl({required this.cacheManager});
  @override
  Future<void> saveUserAuthToken({required String userIdToken}) async {
    try {
      await cacheManager.saveData(data: userIdToken);
    } catch (e) {
      throw CacheException('data is not saved');
    }
  }
}
