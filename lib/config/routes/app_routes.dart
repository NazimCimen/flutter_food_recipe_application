import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/auth/presentation/view/signin_view.dart';
import 'package:flutter_food_recipe_application/feauture/auth/presentation/view/signup_view.dart';
import 'package:flutter_food_recipe_application/feauture/home/home_view.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/presentation/view/onboard_view.dart';
import 'package:flutter_food_recipe_application/feauture/splash/presentation/view/splash_view.dart';

class AppRoutes {
  static const String initialRoute = '/splashView';
  static const String splashView = '/splashView';
  static const String onboardView = '/onboardView';
  static const String loginView = '/loginView';
  static const String signupView = '/signupView';
  static const String homeView = '/homeView';

  static Map<String, WidgetBuilder> get routes => {
        initialRoute: (context) => const SplashView(),
        onboardView: (context) => const OnBoardView(),
        loginView: (context) => const SigninView(),
        signupView: (context) => const SignupView(),
        homeView: (context) => const HomeView(),
      };
}
