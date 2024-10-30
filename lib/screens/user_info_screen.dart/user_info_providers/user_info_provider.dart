import 'package:flutter/material.dart';
import 'package:eagro/models/address_model.dart';
import 'package:eagro/providers/main_provider.dart';
import 'package:eagro/services/user_service.dart';
import 'package:provider/provider.dart';

class UserInfoProvider extends ChangeNotifier {
  final bool isEdit;
  final String userId;
  BuildContext context;

  UserInfoProvider({
    required this.userId,
    required this.isEdit,
    required this.context,
  }) {
    if (isEdit) {
      loadValue();
    }
  }
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final streetNameController = TextEditingController();
  final streetNumberController = TextEditingController();
  final postalCodeController = TextEditingController();

  Future<bool> addAddress() async {
    bool success = await UserService.addAddress(
        id: userId,
        address: AddressModel(
            country: countryController.text,
            city: cityController.text,
            streetName: streetNameController.text,
            streetNumber: streetNumberController.text,
            postalCode: postalCodeController.text));

     
    

    return success;
  }

  Future<bool> updateAddress() async {
    bool success = await UserService.updateAddress(
        id: userId,
        address: AddressModel(
            country: countryController.text,
            city: cityController.text,
            streetName: streetNameController.text,
            streetNumber: streetNumberController.text,
            postalCode: postalCodeController.text));


    return success;
  }

  loadValue() {
    final address = context.read<MainProvider>().user?.address;
    countryController.text = address?.country ?? "";
    cityController.text = address?.city ?? "";
    streetNameController.text = address?.streetName ?? "";
    streetNumberController.text = address?.streetNumber ?? "";
    postalCodeController.text = address?.postalCode ?? "";
  }

  void refresh() {
    notifyListeners();
  }
}
