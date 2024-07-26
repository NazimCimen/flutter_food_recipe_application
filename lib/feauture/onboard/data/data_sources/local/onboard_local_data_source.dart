import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';

abstract class OnBoardLocalDataSource {
  Future<List<OnBoardModel>> getOnBoardData({required Locale locale});
}

class OnBoardLocalDataSourceImpl implements OnBoardLocalDataSource {
  OnBoardLocalDataSourceImpl();

  @override
  Future<List<OnBoardModel>> getOnBoardData({required Locale locale}) async {
    final jsonString = await rootBundle
        .loadString(OnBoardJsonPathProvider.getJsonPath(locale.languageCode));
    final jsonList = json.decode(jsonString) as List;
    return jsonList
        .map(
          (jsonItem) => OnBoardModel.fromJson(jsonItem as Map<String, dynamic>),
        )
        .toList();
  }
}
