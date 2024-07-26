import 'package:flutter_food_recipe_application/feauture/onboard/buissness/entities/onboard_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'onboard_model.g.dart';

@JsonSerializable()
class OnBoardModel extends OnBoardEntity {
  OnBoardModel({
    required String? color,
    required String? title,
    required String? description,
    required String? imagePath,
  }) : super(
            color: color,
            title: title,
            description: description,
            imagePath: imagePath);

  factory OnBoardModel.fromJson(Map<String, dynamic> json) =>
      _$OnBoardModelFromJson(json);
  Map<String, dynamic> toJson() => _$OnBoardModelToJson(this);
}
