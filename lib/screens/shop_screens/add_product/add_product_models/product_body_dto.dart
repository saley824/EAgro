import 'package:json_annotation/json_annotation.dart';

part 'product_body_dto.g.dart';

@JsonSerializable()
class ProductBodyDto {
  final String categoryId;
  final String name;
  final String description;
  final double price;

  final int totalAmount;
  final double? quantity;
  final String? unit;
  final String? image;

  ProductBodyDto({
    required this.categoryId,
    required this.name,
    required this.description,
    required this.price,
    required this.totalAmount,
    required this.quantity,
    required this.unit,
    this.image,
  });

  factory ProductBodyDto.fromJson(Map<String, dynamic> json) =>
      _$ProductBodyDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProductBodyDtoToJson(this);
}
