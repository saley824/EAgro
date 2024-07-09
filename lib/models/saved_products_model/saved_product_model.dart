import 'package:json_annotation/json_annotation.dart';

part 'saved_product_model.g.dart';

@JsonSerializable()
class SavedProductModel {
  final String productId;
  final String userId;

  SavedProductModel({
    required this.productId,
    required this.userId,
  });

  factory SavedProductModel.fromJson(Map<String, dynamic> json) =>
      _$SavedProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$SavedProductModelToJson(this);
}
