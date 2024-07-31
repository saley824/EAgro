import 'package:json_annotation/json_annotation.dart';

part 'order_item_model.g.dart';

@JsonSerializable()
class OrderItemModel {
  final String name;
  final String productId;
  final int quantity;
  final double price;
  final double? discountedPrice;
  final double totalPrice;
  final String? img;

  OrderItemModel({
    required this.name,
    required this.productId,
    required this.quantity,
    required this.price,
    required this.discountedPrice,
    required this.totalPrice,
    required this.img,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderItemModelToJson(this);
}
