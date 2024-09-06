import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';

/// login sign up autovalidateMode
///Validators lang localication.
///ShareStepsIds and posts
///ShareSteps fetch from idead home
///controller or entity management
///error handling
/// camera permission  image pick and crop
/// uygulama silinip tekrar çalışınca onboardan sonra nav bar görünmüyor.
/// fix default image url post and step
///   share post  ///SERACH UTC IS GLOBAL UTC 3 2 .. IMPORTANTTTTTTTTTT
/// share yaparken user ıd'yi eklemeyi unutma

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
