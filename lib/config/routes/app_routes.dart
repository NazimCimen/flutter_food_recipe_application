import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/auth/login_view.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/presentation/view/onboard_view.dart';

class AppRoutes {
  static const String initialRoute = '/initialRoute';
  static const String onboardView = '/onboardView';
  static const String loginView = '/loginView';

  static Map<String, WidgetBuilder> get routes => {
        initialRoute: (context) => OnBoardView(),
        onboardView: (context) => OnBoardView(),
        loginView: (context) => LoginView(),
      };
}
