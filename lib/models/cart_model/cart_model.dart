import 'cart_item_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartModel {
  final int count;
  final double totalPrice;
  final List<CartItemModel> cartItemsDetails;

  CartModel({
    required this.count,
    required this.totalPrice,
    required this.cartItemsDetails,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
