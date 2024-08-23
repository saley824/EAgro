import 'package:json_annotation/json_annotation.dart';

import 'address_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String id;
  final String name;
  final String lastName;
  final String username;
  final bool? isShop;
  final String email;
  AddressModel? address;

  UserModel({
    required this.id,
    required this.name,
    required this.lastName,
    required this.username,
    this.isShop,
    required this.email,
    this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
