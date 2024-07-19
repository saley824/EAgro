import 'package:json_annotation/json_annotation.dart';
import 'package:msan/models/category_model/category_model.dart';

import '/models/products_model/product_price_history.dart';
import 'product_discount.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final String id;
  final String categoryId;
  final String name;
  final String description;
  final double price;
  final double? discountedPrice;
  final DateTime createdAt;
  final CategoryModel category;
  final int totalAmount;
  final int? quantity; //nije
  final String? unit;
  final String? image; //nije
  final ProductDiscountModel? productDiscount;
  final List<ProductPriceHistory>? productPriceHistory;
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
    this.quantity,
    required this.unit,
    required this.image,
    required this.category,
    this.productDiscount,
    this.productPriceHistory,
    this.avgReview,
    required this.countReview,
    this.discountedPrice,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
