import 'package:flutter_food_recipe_application/feauture/splash/splash_export.dart';
import 'package:json_annotation/json_annotation.dart';
part 'app_version_model.g.dart';

@JsonSerializable()
class AppVersionModel extends AppVersionEntity {
  const AppVersionModel(super.versionNumber);
  factory AppVersionModel.fromJson(Map<String, dynamic> json) =>
      _$AppVersionModelFromJson(json);
  Map<String, dynamic> toJson() => _$AppVersionModelToJson(this);
}
