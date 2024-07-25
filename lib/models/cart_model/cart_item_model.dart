import 'package:json_annotation/json_annotation.dart';

part 'cart_item_model.g.dart';

@JsonSerializable()
class CartItemModel {
  final String name;
  final String productId;
  final int quantity;
  final int totalAmount;
  final double price;
  final double? discountedPrice;
  final double cartItemTotalPrice;
  final int? percentage;
  final String? image;

  CartItemModel({
    required this.name,
    required this.productId,
    required this.quantity,
    required this.totalAmount,
    required this.price,
    required this.discountedPrice,
    required this.cartItemTotalPrice,
    required this.percentage,
    required this.image,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);
}
