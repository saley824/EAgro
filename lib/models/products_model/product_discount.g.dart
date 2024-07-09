// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_discount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDiscountModel _$ProductDiscountModelFromJson(
        Map<String, dynamic> json) =>
    ProductDiscountModel(
      percentage: (json['percentage'] as num).toInt(),
      from: DateTime.parse(json['from'] as String),
      to: DateTime.parse(json['to'] as String),
    );

Map<String, dynamic> _$ProductDiscountModelToJson(
        ProductDiscountModel instance) =>
    <String, dynamic>{
      'percentage': instance.percentage,
      'from': instance.from.toIso8601String(),
      'to': instance.to.toIso8601String(),
    };
