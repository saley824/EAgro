// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as String,
      categoryId: json['categoryId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      totalAmount: (json['totalAmount'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      unit: json['unit'] as String,
      image: json['image'] as String?,
      productDiscount: json['productDiscount'] == null
          ? null
          : ProductDiscountModel.fromJson(
              json['productDiscount'] as Map<String, dynamic>),
      productPriceHistory: (json['productPriceHistory'] as List<dynamic>)
          .map((e) => ProductPriceHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      avgReview: (json['avgReview'] as num?)?.toDouble(),
      countReview: (json['countReview'] as num).toInt(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'createdAt': instance.createdAt.toIso8601String(),
      'totalAmount': instance.totalAmount,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'image': instance.image,
      'productDiscount': instance.productDiscount,
      'productPriceHistory': instance.productPriceHistory,
      'avgReview': instance.avgReview,
      'countReview': instance.countReview,
    };
