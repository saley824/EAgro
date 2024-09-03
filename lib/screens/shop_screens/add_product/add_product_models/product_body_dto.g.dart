// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_body_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductBodyDto _$ProductBodyDtoFromJson(Map<String, dynamic> json) =>
    ProductBodyDto(
      categoryId: json['categoryId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      totalAmount: (json['totalAmount'] as num).toInt(),
      quantity: (json['quantity'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ProductBodyDtoToJson(ProductBodyDto instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'totalAmount': instance.totalAmount,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'image': instance.image,
    };
