import 'package:json_annotation/json_annotation.dart';

part 'product_price_history.g.dart';

@JsonSerializable()
class ProductPriceHistory {
  final double newPrice;
  final DateTime changeDate;

  ProductPriceHistory({
    required this.newPrice,
    required this.changeDate,
  });

  factory ProductPriceHistory.fromJson(Map<String, dynamic> json) =>
      _$ProductPriceHistoryFromJson(json);
  Map<String, dynamic> toJson() => _$ProductPriceHistoryToJson(this);
}
