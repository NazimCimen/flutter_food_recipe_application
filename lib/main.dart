import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';

void main() async {
  final appInit = AppInitImpl();
  await appInit.run();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(
      builder: (context, provider, child) => MaterialApp(
        title: StringConstants.appName,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: CustomLightTheme().themeData,
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigatorService.navigatorKey,
        routes: AppRoutes.routes,
        initialRoute: AppRoutes.initialRoute,
        //home: TestView(),
      ),
    );
  }
}
