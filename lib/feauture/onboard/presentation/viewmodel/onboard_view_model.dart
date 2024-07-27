import 'package:flutter_food_recipe_application/feauture/onboard/buissness/usecases/set_onboard_shown_usecase.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';
import 'package:flutter/material.dart';

class OnboardViewModel extends ChangeNotifier {
  OnboardViewModel({
    required this.getOnBoardDatas,
    required this.setOnBoardShownUseCase,
    this.failure,
    this.onBoardDatas,
  });

  final GetOnBoardDatasUseCase getOnBoardDatas;
  final SetOnBoardShownUseCase setOnBoardShownUseCase;
  List<OnBoardEntity?>? onBoardDatas;
  Failure? failure;

  Future<void> eitherFailureOrOnBoardDatas({
    required Locale locale,
  }) async {
    final failureOrOnboard = await getOnBoardDatas.call(locale: locale);

    failureOrOnboard.fold((failure) {
      this.failure = failure;
      notifyListeners();
    }, (onboardDatas) {
      onBoardDatas = onboardDatas;
      notifyListeners();
    });
  }

  Future<void> setOnBoardShown() async {
    await setOnBoardShownUseCase.call();
  }
}
