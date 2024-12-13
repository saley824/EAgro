// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      id: (json['id'] as num).toInt(),
      userId: json['userId'] as String,
      status: json['status'] as String,
      totalPrice: (json['totalPrice'] as num).toDouble(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      sentTime: json['sentTime'] == null
          ? null
          : DateTime.parse(json['sentTime'] as String),
      finishedTime: json['finishedTime'] == null
          ? null
          : DateTime.parse(json['finishedTime'] as String),
      rejectedTime: json['rejectedTime'] == null
          ? null
          : DateTime.parse(json['rejectedTime'] as String),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'status': instance.status,
      'totalPrice': instance.totalPrice,
      'createdAt': instance.createdAt?.toIso8601String(),
      'sentTime': instance.sentTime?.toIso8601String(),
      'finishedTime': instance.finishedTime?.toIso8601String(),
      'rejectedTime': instance.rejectedTime?.toIso8601String(),
      'user': instance.user,
    };
