import 'package:json_annotation/json_annotation.dart';
import 'package:eagro/models/user_model.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  final int id;
  final String userId;
  final String status;
  final double totalPrice;
  final DateTime? createdAt;
  final DateTime? sentTime;
  final DateTime? finishedTime;
  final DateTime? rejectedTime;
  final UserModel? user;

  OrderModel({
    required this.id,
    required this.userId,
    required this.status,
    required this.totalPrice,
    required this.createdAt,
    required this.sentTime,
    required this.finishedTime,
    required this.rejectedTime,
    required this.user,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
