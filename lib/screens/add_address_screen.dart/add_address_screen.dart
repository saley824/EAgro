import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../models/address_model.dart';
import '../../providers/main_provider.dart';
import '/widgets/buttons/agro_button.dart';
import '/widgets/input_fields/agro_input_field.dart';
import '../../../helpers/helper_functions.dart';
import '../../../helpers/snack_bar_messages.dart';
import '../user_info_screen.dart/user_info_providers/user_info_provider.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userInfoProvider = context.read<UserInfoProvider>();
    final mainProvider = context.read<MainProvider>();
    final isEdit = mainProvider.user?.address != null;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: HelperFunctions.getSubAppBar(
        context: context,
        title: isEdit ? "Izmjena adrese" : "Dodavanje adrese",
      ),
      body: SafeArea(
        child: PopScope(
          onPopInvokedWithResult: (didPop, result) => {
            if (didPop) {userInfoProvider.loadValue()}
          },
          child: Container(
            color: Colors.white,
            // color: CustomColors.jadeGreen[50],
            padding: const EdgeInsets.all(20),
            child: Consumer<UserInfoProvider>(
              builder: (_, __, ___) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(24),
                  AgroInputField(
                    labelVisible: true,
                    hintText: "Država",
                    textEditingController: userInfoProvider.countryController,
                  ),
                  const Gap(20),
                  AgroInputField(
                    labelVisible: true,
                    hintText: "Grad",
                    textEditingController: userInfoProvider.cityController,
                  ),
                  const Gap(20),
                  AgroInputField(
                    labelVisible: true,
                    hintText: "Ulica",
                    textEditingController:
                        userInfoProvider.streetNameController,
                  ),
                  const Gap(20),
                  AgroInputField(
                    labelVisible: true,
                    hintText: "Kućni broj",
                    textEditingController:
                        userInfoProvider.streetNumberController,
                  ),
                  const Gap(20),
                  AgroInputField(
                    labelVisible: true,
                    hintText: "Poštanski kod",
                    textEditingController:
                        userInfoProvider.postalCodeController,
                  ),
                  const Gap(20),
                  const Spacer(),
                  AgroButton(
                      buttonColor: ButtonColor.jadeGreen,
                      disabled: false,
                      text: isEdit ? "Promijeni adresu" : "Dodaj adresu",
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        bool success = false;
                        HelperFunctions.callMethodWithLoadingDialog(
                            context: context,
                            callback: () async {
                              success = isEdit
                                  ? await userInfoProvider.updateAddress()
                                  : await userInfoProvider.addAddress();
                            },
                            onFinished: () {
                              if (success) {
                                if (isEdit) {
                                  final address = context
                                      .read<MainProvider>()
                                      .user
                                      ?.address;
                                  address?.country =
                                      userInfoProvider.countryController.text;
                                  address?.city =
                                      userInfoProvider.cityController.text;
                                  address?.streetName = userInfoProvider
                                      .streetNameController.text;
                                  address?.streetNumber = userInfoProvider
                                      .streetNumberController.text;
                                  address?.postalCode = userInfoProvider
                                      .postalCodeController.text;
                                }
                                else{
                                   context.read<MainProvider>().user?.address =
                                    AddressModel(
                                  city: userInfoProvider.cityController.text,
                                  country:
                                      userInfoProvider.countryController.text,
                                  streetName: userInfoProvider
                                      .streetNameController.text,
                                  streetNumber: userInfoProvider
                                      .streetNumberController.text,
                                  postalCode: userInfoProvider
                                      .postalCodeController.text,
                                );

                                }
                               
                                SnackBarMessage.showMessage(
                                  context: context,
                                  text: userInfoProvider.isEdit
                                      ? "Adresa je uspješno izmjenjena.."
                                      : "Adresa je uspješno dodana.",
                                  isError: false,
                                );

                                userInfoProvider.refresh();
                                Navigator.of(context).pop();
                                return;
                              }
                              SnackBarMessage.showMessage(
                                  context: context,
                                  text: "Greška",
                                  isError: true);

                              return;
                            });
                      }),
                  const Gap(20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
