import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';
import 'package:json_annotation/json_annotation.dart';
part 'onboard_model.g.dart';

@JsonSerializable()
class OnBoardModel extends OnBoardEntity {
  OnBoardModel({
    required super.color,
    required super.title,
    required super.description,
    required super.imagePath,
  });

  factory OnBoardModel.fromJson(Map<String, dynamic> json) =>
      _$OnBoardModelFromJson(json);
  Map<String, dynamic> toJson() => _$OnBoardModelToJson(this);
}
