import 'package:flutter_food_recipe_application/feauture/splash/splash_export.dart';

abstract class SplashLocalDataSource {
  Future<bool?> checkCacheOnboardShown();
}

class SplashLocalDataSourceImpl implements SplashLocalDataSource {
  final SharedPreferences sharedPreferences;
  SplashLocalDataSourceImpl(this.sharedPreferences);

  /// CHECKING CACHE FOR ONBOARD SCREEN VISIBILITY FLAG
  @override
  Future<bool?> checkCacheOnboardShown() async {
    try {
      final result = sharedPreferences.getBool(LocalKeysEnum.onboard.name);
      return result;
    } catch (e) {
      throw CacheException('cache errror');
    }
  }
}
