// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'most_used_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MostUsedCategoryModel _$MostUsedCategoryModelFromJson(
        Map<String, dynamic> json) =>
    MostUsedCategoryModel(
      categoryId: json['categoryId'] as String,
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$MostUsedCategoryModelToJson(
        MostUsedCategoryModel instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'count': instance.count,
    };
