import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/presentation/viewmodel/onboard_view_model.dart';
import 'package:flutter_food_recipe_application/main.dart';

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
            create: (_) => sl<IThemeManager>() as ThemeManager,
          ),
          ChangeNotifierProvider(
            create: (context) => OnboardViewModel(),
          ),
        ],
        child: const MyApp(),
      ),
    );
  }

  @override
  Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    setupLocator();
  }

  @override
  Future<void> run() async {
    await initialize();
    runApp(getApp());
  }
}
