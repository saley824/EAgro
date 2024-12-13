import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '/screens/login_screen/login_providers/login_service.dart';
import '/widgets/buttons/agro_button.dart';
import '/widgets/input_fields/agro_input_field.dart';
import '../../../helpers/helper_functions.dart';
import '../../../helpers/snack_bar_messages.dart';
import 'change_password_provider.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final changePasswordProvider = context.read<ChangePasswordProvider>();
    return Scaffold(
      appBar: HelperFunctions.getSubAppBar(context: context, title:  "Promijeni šifru"),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          // color: CustomColors.jadeGreen[50],
          padding: const EdgeInsets.all(20),
          child: Consumer<ChangePasswordProvider>(
            builder: (_, __, ___) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(24),
                AgroInputField(
                  labelVisible: true,
                  hintText: "Stara šifra",
                  textEditingController:
                      changePasswordProvider.oldPasswordController,
                  passwordField: true,
                ),
                const Gap(20),
                AgroInputField(
                  labelVisible: true,
                  hintText: "Nova šifra",
                  textEditingController:
                      changePasswordProvider.passwordController,
                  passwordField: true,
                ),
                const Gap(20),
                AgroInputField(
                  labelVisible: true,
                  hintText: "Potvrdi šifru",
                  textEditingController:
                      changePasswordProvider.confirmPasswordController,
                  passwordField: true,
                ),
                const Gap(20),
                const Gap(20),
                const Spacer(),
                AgroButton(
                    buttonColor: ButtonColor.jadeGreen,
                    disabled: false,
                    text: "Promijeni šifru",
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      bool success = false;
                      HelperFunctions.callMethodWithLoadingDialog(
                          context: context,
                          callback: () async {
                            success =
                                await changePasswordProvider.changePassword();
                          },
                          onFinished: () {
                            if (success) {
                              SnackBarMessage.showMessage(
                                  context: context,
                                  text: "Uspješno promijenjena šifra",
                                  isError: false);

                              LoginService.logOut(context);
                              return;
                            }
                            SnackBarMessage.showMessage(
                                context: context, text: "Desila se greška!", isError: true);

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
