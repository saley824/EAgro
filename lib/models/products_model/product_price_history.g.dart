// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_price_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductPriceHistory _$ProductPriceHistoryFromJson(Map<String, dynamic> json) =>
    ProductPriceHistory(
      newPrice: (json['newPrice'] as num).toDouble(),
      changeDate: DateTime.parse(json['changeDate'] as String),
    );

Map<String, dynamic> _$ProductPriceHistoryToJson(
        ProductPriceHistory instance) =>
    <String, dynamic>{
      'newPrice': instance.newPrice,
      'changeDate': instance.changeDate.toIso8601String(),
    };
