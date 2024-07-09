// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      count: (json['count'] as num).toInt(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      cartItemsDetails: (json['cartItemsDetails'] as List<dynamic>)
          .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'count': instance.count,
      'totalPrice': instance.totalPrice,
      'cartItemsDetails': instance.cartItemsDetails,
    };
