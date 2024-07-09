import 'package:json_annotation/json_annotation.dart';
import '/models/products_model/product_discount.dart';
import '/models/products_model/product_price_history.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final String id;
  final String categoryId;
  final String name;
  final String description;
  final String price;
  final DateTime createdAt;
  final int totalAmount;
  final int quantity;
  final String unit;
  final String? image;
  final ProductDiscountModel? productDiscount;
  final List<ProductPriceHistory> productPriceHistory;
  final double? avgReview;
  final int countReview;

  ProductModel({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.price,
    required this.createdAt,
    required this.totalAmount,
    required this.quantity,
    required this.unit,
    required this.image,
    required this.productDiscount,
    required this.productPriceHistory,
    required this.avgReview,
    required this.countReview,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
