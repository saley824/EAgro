import 'package:json_annotation/json_annotation.dart';

part 'cart_count_model.g.dart';

@JsonSerializable()
class CartCountModel {
  final int count;


  CartCountModel({
    required this.count,

  });

  factory CartCountModel.fromJson(Map<String, dynamic> json) =>
      _$CartCountModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartCountModelToJson(this);
}
