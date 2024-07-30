import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/auth/login_view.dart';
import 'package:flutter_food_recipe_application/feauture/home/home_view.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/presentation/view/onboard_view.dart';
import 'package:flutter_food_recipe_application/feauture/splash/presentation/view/splash_view.dart';

class AppRoutes {
  static const String initialRoute = '/splashView';
  static const String onboardView = '/onboardView';
  static const String loginView = '/loginView';
  static const String splashView = '/splashView';
  static const String homeView = '/homeView';

  static Map<String, WidgetBuilder> get routes => {
        initialRoute: (context) => const SplashView(),
        onboardView: (context) => const OnBoardView(),
        loginView: (context) => const LoginView(),
        homeView: (context) => const HomeView(),
      };
}
