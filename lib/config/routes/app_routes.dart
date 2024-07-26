import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/presentation/view/onboard_view.dart';

class AppRoutes {
  static const String initialRoute = '/initialRoute';
  static const String onboardingScreen = '/onboarding_screen';

  static Map<String, WidgetBuilder> get routes => {
        initialRoute: (context) => OnBoardView(),
        onboardingScreen: (context) => OnBoardView(),
      };
}
