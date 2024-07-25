// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    CartItemModel(
      name: json['name'] as String,
      productId: json['productId'] as String,
      quantity: (json['quantity'] as num).toInt(),
      totalAmount: (json['totalAmount'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      discountedPrice: (json['discountedPrice'] as num?)?.toDouble(),
      cartItemTotalPrice: (json['cartItemTotalPrice'] as num).toDouble(),
      percentage: (json['percentage'] as num?)?.toInt(),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$CartItemModelToJson(CartItemModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'productId': instance.productId,
      'quantity': instance.quantity,
      'totalAmount': instance.totalAmount,
      'price': instance.price,
      'discountedPrice': instance.discountedPrice,
      'cartItemTotalPrice': instance.cartItemTotalPrice,
      'percentage': instance.percentage,
      'image': instance.image,
    };
