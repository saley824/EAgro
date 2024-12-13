import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '/helpers/helper_functions.dart';
import '/helpers/navigator_helper.dart';
import '/widgets/buttons/agro_button.dart';
import '../../helpers/snack_bar_messages.dart';
import '../../widgets/input_fields/agro_input_field.dart';
import 'forgot_password_providers/forgot_password_provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final globalAppNavigator = Navigator.of(context);
    final forgotPassword =
        Provider.of<ForgotPasswordProvider>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            gradient: HelperFunctions.getBackGroundGradient(),
          ),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional.center,
                child: Column(
                  children: [
                    Text(
                      "Resetovanje šifre",
                      style: textTheme.headlineMedium!
                          .copyWith(color: Colors.black),
                    ),

                    const SizedBox(height: 120),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                          "Unesite vaš email",
                          style: textTheme.bodyLarge!
                              .copyWith(color: Colors.black),
                                              ),
                        ],
                      ),
                      const Gap(8),
                    AgroInputField(
                      onInputChanged: forgotPassword.enableButton,
                      height: 48,
                      hintText: "Email",
                      labelVisible: true,
                      textEditingController: forgotPassword.emailController,
                    ),
                    const Gap(20),
                    Consumer<ForgotPasswordProvider>(
                      builder: (_, __, ___) => AgroButton(
                        disabled: !forgotPassword.isButtonEnabled,
                        text: "Pošalji",
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          bool success = false;
                          HelperFunctions.callMethodWithLoadingDialog(
                              context: context,
                              callback: () async {
                                success = await forgotPassword.forgotPassword();
                              },
                              onFinished: () {
                                if (success) {
                                  SnackBarMessage.showMessage(
                                    context: context,
                                    text:
                                        "Token je usješno poslan na Email!",
                                    isError: false,
                                  );

                                  NavigatorHelper.navigateToResetPassword(
                                      context);
                                  return;
                                }
                                HelperFunctions.getErrorSnackBar(context);
                                return;
                              });
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        globalAppNavigator.pop();
                      },
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.all(4)),
                      child: const Text("Nazad na ekran za prijavu!"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
