import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';
import 'package:flutter/material.dart';

class OnboardViewModel extends ChangeNotifier {
  OnboardViewModel({this.failure, this.onBoardDatas});

  List<OnBoardEntity?>? onBoardDatas;
  Failure? failure;

  Future<void> eitherFailureOrOnBoardDatas({
    required Locale locale,
  }) async {
    final repository = OnBoardRepositoryImpl(
      localDataSource: OnBoardLocalDataSourceImpl(),
    );
    final failureOrOnboard =
        await GetOnBoardDatas(repository).call(locale: locale);

    failureOrOnboard.fold((failure) {
      this.failure = failure;
      notifyListeners();
    }, (onboardDatas) {
      onBoardDatas = onboardDatas;
      notifyListeners();
    });
  }
}
