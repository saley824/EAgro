import 'package:json_annotation/json_annotation.dart';

import '/models/products_model/product_discount.dart';

part 'product_list_model.g.dart';

@JsonSerializable()
class ProductListModel {
  final String id;
  final String categoryId;
  final String name;
  final double price;
  final DateTime createdAt;
  final double? quantity;
  final String unit;
  final String? image;
  final ProductDiscountModel? productDiscount;
  final double? avgReview;
  final int countReview;
  final double? discountedPrice;

  ProductListModel({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.price,
    required this.createdAt,
    this.quantity,
    required this.unit,
    this.image,
    this.productDiscount,
    this.avgReview,
    required this.countReview,
    this.discountedPrice,
  });

  factory ProductListModel.fromJson(Map<String, dynamic> json) =>
      _$ProductListModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductListModelToJson(this);
}
