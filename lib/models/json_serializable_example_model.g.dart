// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_serializable_example_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonSerializableExampleModel _$JsonSerializableExampleModelFromJson(
        Map<String, dynamic> json) =>
    JsonSerializableExampleModel(
      stringParam: json['stringParam'] as String,
      dateTimeParam: json['dateTimeParam'] == null
          ? null
          : DateTime.parse(json['dateTimeParam'] as String),
    );

Map<String, dynamic> _$JsonSerializableExampleModelToJson(
        JsonSerializableExampleModel instance) =>
    <String, dynamic>{
      'stringParam': instance.stringParam,
      'dateTimeParam': instance.dateTimeParam?.toIso8601String(),
    };
