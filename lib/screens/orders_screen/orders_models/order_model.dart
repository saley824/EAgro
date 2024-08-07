import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  final String id;
  final String userId;
  final String status;
  final double totalPrice;
  final DateTime? createdAt;
  final DateTime? sentTime;
  final DateTime? finishedTime;
  final DateTime? rejectedTime;

  OrderModel({
    required this.id,
    required this.userId,
    required this.status,
    required this.totalPrice,
    required this.createdAt,
    required this.sentTime,
    required this.finishedTime,
    required this.rejectedTime,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
