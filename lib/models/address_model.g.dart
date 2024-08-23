// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      country: json['country'] as String,
      city: json['city'] as String,
      streetName: json['streetName'] as String,
      streetNumber: json['streetNumber'] as String,
      postalCode: json['postalCode'] as String?,
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'country': instance.country,
      'city': instance.city,
      'streetName': instance.streetName,
      'streetNumber': instance.streetNumber,
      'postalCode': instance.postalCode,
    };
