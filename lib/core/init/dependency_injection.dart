import 'package:flutter_food_recipe_application/core/app_core_export.dart';

final sl = GetIt.instance;
void setupLocator() {
  sl
    ..registerLazySingleton<INetworkInfo>(() => NetworkInfo(sl<Connectivity>()))
    ..registerLazySingleton<IThemeManager>(() => ThemeManager());
}
