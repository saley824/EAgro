import 'package:flutter/material.dart';
import 'package:msan/models/address_model.dart';
import 'package:msan/providers/main_provider.dart';
import 'package:msan/services/user_service.dart';
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
      final address = context.read<MainProvider>().user?.address;
      countryController.text = address?.country ?? "";
      cityController.text = address?.city ?? "";
      streetNameController.text = address?.streetName ?? "";
      streetNumberController.text = address?.streetNumber ?? "";
      postalCodeController.text = address?.postalCode ?? "";
    }
  }
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final streetNameController = TextEditingController();
  final streetNumberController = TextEditingController();
  final postalCodeController = TextEditingController();

  Future<bool> addAddress() async {
    return await UserService.addAddress(
        id: userId,
        address: AddressModel(
            country: countryController.text,
            city: cityController.text,
            streetName: streetNameController.text,
            streetNumber: streetNumberController.text,
            postalCode: postalCodeController.text));
  }

  Future<bool> updateAddress() async {
    return await UserService.updateAddress(
        id: userId,
        address: AddressModel(
            country: countryController.text,
            city: cityController.text,
            streetName: streetNameController.text,
            streetNumber: streetNumberController.text,
            postalCode: postalCodeController.text));
  }

  Future<bool> addressAction(BuildContext context) async {
    bool success = false;
    if (isEdit) {
      success = await updateAddress();
    } else {
      success = await addAddress();
    }

    if (context.mounted) {
      final address = context.read<MainProvider>().user?.address;
      address?.country = countryController.text;
      address?.city = cityController.text;
      address?.streetName = streetNameController.text;
      address?.streetNumber = streetNumberController.text;
      address?.postalCode = postalCodeController.text;
    }

    return success;
  }

  void refresh() {
    notifyListeners();
  }
}
