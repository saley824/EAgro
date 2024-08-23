import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel {
  String country;
  String city;
  String streetName;
  String streetNumber;
  String? postalCode;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  AddressModel(
      {required this.country,
      required this.city,
      required this.streetName,
      required this.streetNumber,
      required this.postalCode});
  Map<String, dynamic> toJson() => _$AddressModelToJson(this);

  @override
  String toString() {
    return "$city, $country, $streetName, $streetNumber, $postalCode ";
  }
}
