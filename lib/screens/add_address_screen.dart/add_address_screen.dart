import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

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
    return Scaffold(
      appBar: HelperFunctions.getSubAppBar(context, "Add address"),
      body: SafeArea(
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
                  hintText: "Country",
                  textEditingController: userInfoProvider.countryController,
                ),
                const Gap(20),
                AgroInputField(
                  labelVisible: true,
                  hintText: "City",
                  textEditingController: userInfoProvider.cityController,
                ),
                const Gap(20),
                AgroInputField(
                  labelVisible: true,
                  hintText: "Street",
                  textEditingController: userInfoProvider.streetNameController,
                ),
                const Gap(20),
                AgroInputField(
                  labelVisible: true,
                  hintText: "Street number",
                  textEditingController:
                      userInfoProvider.streetNumberController,
                ),
                const Gap(20),
                AgroInputField(
                  labelVisible: true,
                  hintText: "Postal code",
                  textEditingController: userInfoProvider.postalCodeController,
                ),
                const Gap(20),
                const Spacer(),
                AgroButton(
                    buttonColor: ButtonColor.jadeGreen,
                    disabled: false,
                    text: userInfoProvider.isEdit
                        ? "Edit address"
                        : "Add address",
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      bool success = false;
                      HelperFunctions.callMethodWithLoadingDialog(
                          context: context,
                          callback: () async {
                            success =
                                await userInfoProvider.addressAction(context);
                          },
                          onFinished: () {
                            if (success) {
                              SnackBarMessage.showMessage(
                                  context: context,
                                  text: userInfoProvider.isEdit
                                      ? "Successfully changed address"
                                      : "Successfully added address",
                                  isError: false);

                              Navigator.of(context).pop();
                              userInfoProvider.refresh();
                              return;
                            }
                            SnackBarMessage.showMessage(
                                context: context, text: "Error", isError: true);

                            return;
                          });
                    }),
                const Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
