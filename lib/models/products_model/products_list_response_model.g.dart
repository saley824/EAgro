// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsListResponseModel _$ProductsListResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProductsListResponseModel(
      hasNext: json['hasNext'] as bool,
      count: (json['count'] as num).toInt(),
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsListResponseModelToJson(
        ProductsListResponseModel instance) =>
    <String, dynamic>{
      'hasNext': instance.hasNext,
      'count': instance.count,
      'products': instance.products,
    };
