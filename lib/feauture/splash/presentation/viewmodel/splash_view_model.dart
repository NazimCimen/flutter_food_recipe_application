import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/splash/splash_export.dart';

class SplashViewModel extends ChangeNotifier {
  final CheckCacheOnboardShownUseCase checkCacheOnboardShownUseCase;
  SplashViewModel(this.checkCacheOnboardShownUseCase);
  bool? onBoardShown;
  Future<void> checkSplashShown() async {
    final failureOrResult = await checkCacheOnboardShownUseCase.call();

    failureOrResult.fold((fail) {
      onBoardShown = false;
      notifyListeners();
    }, (result) {
      onBoardShown = result ?? false;
      notifyListeners();
    });
  }
}
