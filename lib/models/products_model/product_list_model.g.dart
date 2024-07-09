// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductListModel _$ProductListModelFromJson(Map<String, dynamic> json) =>
    ProductListModel(
      id: json['id'] as String,
      categoryId: json['categoryId'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      quantity: (json['quantity'] as num?)?.toDouble(),
      unit: json['unit'] as String,
      image: json['image'] as String?,
      productDiscount: json['productDiscount'] == null
          ? null
          : ProductDiscountModel.fromJson(
              json['productDiscount'] as Map<String, dynamic>),
      avgReview: (json['avgReview'] as num?)?.toDouble(),
      countReview: (json['countReview'] as num).toDouble(),
      discountedPrice: (json['discountedPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProductListModelToJson(ProductListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'name': instance.name,
      'price': instance.price,
      'createdAt': instance.createdAt.toIso8601String(),
      'quantity': instance.quantity,
      'unit': instance.unit,
      'image': instance.image,
      'productDiscount': instance.productDiscount,
      'avgReview': instance.avgReview,
      'countReview': instance.countReview,
      'discountedPrice': instance.discountedPrice,
    };
