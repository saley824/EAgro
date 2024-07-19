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
      price: (json['price'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      totalAmount: (json['totalAmount'] as num).toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      unit: json['unit'] as String?,
      image: json['image'] as String?,
      category:
          CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      productDiscount: json['productDiscount'] == null
          ? null
          : ProductDiscountModel.fromJson(
              json['productDiscount'] as Map<String, dynamic>),
      productPriceHistory: (json['productPriceHistory'] as List<dynamic>?)
          ?.map((e) => ProductPriceHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      avgReview: (json['avgReview'] as num?)?.toDouble(),
      countReview: (json['countReview'] as num).toInt(),
      discountedPrice: (json['discountedPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'discountedPrice': instance.discountedPrice,
      'createdAt': instance.createdAt.toIso8601String(),
      'category': instance.category,
      'totalAmount': instance.totalAmount,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'image': instance.image,
      'productDiscount': instance.productDiscount,
      'productPriceHistory': instance.productPriceHistory,
      'avgReview': instance.avgReview,
      'countReview': instance.countReview,
    };
