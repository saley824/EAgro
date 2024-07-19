// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
      productId: json['productId'] as String,
      userId: json['userId'] as String,
      rating: (json['rating'] as num).toInt(),
    );

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'userId': instance.userId,
      'rating': instance.rating,
    };
