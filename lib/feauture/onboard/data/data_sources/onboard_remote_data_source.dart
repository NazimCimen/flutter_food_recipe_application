import 'dart:io';

import 'package:flutter_food_recipe_application/core/error/exception.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/data/model/onboard_model.dart';
import 'package:dio/dio.dart';

abstract class OnBoardRemoteDataSource {
  Future<List<OnBoardModel>> getOnBoardDatas();
}

class OnBoardRemoteDataSourceImpl implements OnBoardRemoteDataSource {
  final Dio dio;
  OnBoardRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<OnBoardModel>> getOnBoardDatas() async {
    final response = await dio
        .get('https://mocki.io/v1/3b92c250-6454-4449-b6f4-03f8ec634494');
    if (response.statusCode == HttpStatus.ok) {
      final responseData = response.data as List<dynamic>;
      final list = responseData
          .map(
            (e) => OnBoardModel.fromJson(e as Map<String, dynamic>),
          )
          .toList();
      return list;
    } else {
      throw ServerException();
    }
  }
}
