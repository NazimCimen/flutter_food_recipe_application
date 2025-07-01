import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';

abstract class OnBoardLocalDataSource {
  Future<List<OnBoardModel>> getOnBoardData({required Locale locale});
  Future<void> setOnBoardShown();
}

@immutable
class OnBoardLocalDataSourceImpl implements OnBoardLocalDataSource {
  final SharedPreferences sharedPreferences;
  final OnBoardJsonPathProvider jsonPathProvider;

  const OnBoardLocalDataSourceImpl(
      this.sharedPreferences, this.jsonPathProvider);

  /// FETCH ONBOARD SCREEN DATAS FROM LOCALE
  @override
  Future<List<OnBoardModel>> getOnBoardData({required Locale locale}) async {
    try {
      final jsonString = await rootBundle
          .loadString(jsonPathProvider.getJsonPath(locale.languageCode));
      final jsonList = json.decode(jsonString) as List;
      return jsonList
          .map(
            (jsonItem) =>
                OnBoardModel.fromJson(jsonItem as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      throw CacheException('cache error');
    }
  }

  /// SET AND SAVE ONBOARD SCREEN VISIBILITY FLAG
  @override
  Future<void> setOnBoardShown() async {
    await sharedPreferences.setBool(
        LocalKeysEnum.onboardVisibility3.name, true);
  }
}
