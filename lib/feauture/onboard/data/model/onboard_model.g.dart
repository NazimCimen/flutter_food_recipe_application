// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnBoardModel _$OnBoardModelFromJson(Map<String, dynamic> json) => OnBoardModel(
      color: json['color'] as String?,
      title: json['title'] as String?,
      imagePath: json['imagePath'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$OnBoardModelToJson(OnBoardModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'color': instance.color,
      'description': instance.description,
      'imagePath': instance.imagePath,
    };
