import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';
import 'package:flutter/material.dart';

class OnboardViewModel extends ChangeNotifier {
  OnboardViewModel({
    required this.getOnBoardDatasUseCase,
    required this.setOnBoardShownUseCase,
    this.failure,
    this.onBoardDatas,
  });

  final GetOnBoardDatasUseCase getOnBoardDatasUseCase;
  final SetOnBoardShownUseCase setOnBoardShownUseCase;
  List<OnBoardEntity?>? onBoardDatas;
  Failure? failure;

  /// FETCH ONBOARD SCREEN DATAS FROM LOCALE
  Future<void> eitherFailureOrOnBoardDatas({
    required Locale locale,
  }) async {
    final failureOrOnboard = await getOnBoardDatasUseCase.call(locale: locale);

    failureOrOnboard.fold((failure) {
      this.failure = failure;
      notifyListeners();
    }, (onboardDatas) {
      onBoardDatas = onboardDatas;
      notifyListeners();
    });
  }

  /// SET AND SAVE ONBOARD SCREEN VISIBILITY FLAG
  Future<void> setOnBoardShown() async {
    await setOnBoardShownUseCase.call();
  }
}
