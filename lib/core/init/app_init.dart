import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';
import 'package:flutter_food_recipe_application/feauture/home/presentation/viewmodel/home_view_model.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/viewmodel/share_recipe_view_model.dart';
import 'package:flutter_food_recipe_application/main.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class AppInit {
  Future<void> initialize();
  Future<void> run();
  Widget getApp();
}

class AppInitImpl extends AppInit {
  @override
  Widget getApp() {
    return EasyLocalization(
      supportedLocales: const [
        LocaleConstants.enLocale,
        LocaleConstants.trLocale,
        LocaleConstants.frLocale,
        LocaleConstants.arLocale,
        LocaleConstants.esLocale,
        LocaleConstants.deLocale,
        LocaleConstants.itLocale,
        LocaleConstants.ptLocale,
        LocaleConstants.zhLocale,
        LocaleConstants.jaLocale,
        LocaleConstants.ruLocale,
      ],
      path: LocaleConstants.localePath,
      fallbackLocale: LocaleConstants.enLocale,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeManager>(
            create: (_) => serviceLocator<IThemeManager>() as ThemeManager,
          ),
          ChangeNotifierProvider<OnboardViewModel>(
            create: (_) => serviceLocator<OnboardViewModel>(),
          ),
          ChangeNotifierProvider<AuthViewModel>(
            create: (_) => serviceLocator<AuthViewModel>(),
          ),
          ChangeNotifierProvider<HomeViewModel>(
            create: (_) => serviceLocator<HomeViewModel>(),
          ),
          ChangeNotifierProvider<ShareRecipeViewModel>(
            create: (_) => serviceLocator<ShareRecipeViewModel>(),
          )
        ],
        child: const MyApp(),
      ),
    );
  }

  @override
  Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await Hive.initFlutter();
    setupLocator();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @override
  Future<void> run() async {
    await initialize();
    runApp(getApp());
  }
}
