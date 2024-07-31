// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) =>
    OrderItemModel(
      name: json['name'] as String,
      productId: json['productId'] as String,
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      discountedPrice: (json['discountedPrice'] as num?)?.toDouble(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      img: json['img'] as String?,
    );

Map<String, dynamic> _$OrderItemModelToJson(OrderItemModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'productId': instance.productId,
      'quantity': instance.quantity,
      'price': instance.price,
      'discountedPrice': instance.discountedPrice,
      'totalPrice': instance.totalPrice,
      'img': instance.img,
    };
