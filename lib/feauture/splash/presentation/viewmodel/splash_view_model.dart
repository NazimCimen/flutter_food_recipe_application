import 'package:flutter_food_recipe_application/feauture/splash/splash_export.dart';

class SplashViewModel {
  final CheckCacheOnboardShownUseCase checkCacheOnboardShownUseCase;
  SplashViewModel(this.checkCacheOnboardShownUseCase);

  Future<bool> checkOnboardShown() async {
    final failureOrResult = await checkCacheOnboardShownUseCase.call();
    var result = false;
    failureOrResult.fold((fail) {
      result = false;
    }, (succes) {
      result = succes ?? false;
    });
    return result;
  }
}
