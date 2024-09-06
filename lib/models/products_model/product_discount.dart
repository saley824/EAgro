import 'package:json_annotation/json_annotation.dart';

part 'product_discount.g.dart';

@JsonSerializable()
class ProductDiscountModel {
  final int percentage;
  final DateTime from;
  final DateTime to;
  final bool hasDiscount;

  ProductDiscountModel({
    required this.percentage,
    required this.from,
    required this.to,
    this.hasDiscount = false,
  });
  factory ProductDiscountModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDiscountModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDiscountModelToJson(this);
}
