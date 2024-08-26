import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '/helpers/helper_functions.dart';
import '/helpers/snack_bar_messages.dart';
import '/screens/forgot_password/reset_password/reset_password_provider.dart';
import '/widgets/buttons/agro_button.dart';
import '/widgets/input_fields/agro_input_field.dart';
import '../../login_screen/login_providers/login_provider.dart';
import '../../login_screen/login_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final globalAppNavigator = Navigator.of(context);
    final resetPasswordProvider =
        Provider.of<ResetPasswordProvider>(context, listen: false);
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
                      "Welcome to",
                      style: textTheme.headlineMedium!
                          .copyWith(color: Colors.black),
                    ),
                    Text(
                      "Agro Shop",
                      style: textTheme.headlineLarge!
                          .copyWith(color: Colors.black),
                    ),
                    const Gap(120),
                    AgroInputField(
                      onInputChanged: resetPasswordProvider.enableButton,
                      height: 48,
                      hintText: "Token",
                      labelVisible: true,
                      textEditingController:
                          resetPasswordProvider.tokenController,
                    ),
                    const Gap(20),
                    AgroInputField(
                      onInputChanged: resetPasswordProvider.enableButton,
                      height: 48,
                      hintText: "Password",
                      labelVisible: true,
                      textEditingController:
                          resetPasswordProvider.passwordController,
                      passwordField: true,
                    ),
                    const Gap(20),
                    AgroInputField(
                      onInputChanged: resetPasswordProvider.enableButton,
                      height: 48,
                      hintText: "Confirm password",
                      labelVisible: true,
                      textEditingController:
                          resetPasswordProvider.confirmPasswordController,
                      passwordField: true,
                    ),
                    const Gap(20),
                    Consumer<ResetPasswordProvider>(
                      builder: (_, __, ___) => AgroButton(
                        disabled: !resetPasswordProvider.isButtonEnabled,
                        text: "Reset password",
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          bool success = false;
                          HelperFunctions.callMethodWithLoadingDialog(
                              context: context,
                              callback: () async {
                                success =
                                    await resetPasswordProvider.resetPassword();
                              },
                              onFinished: () {
                                if (success) {
                                  SnackBarMessage.showMessage(
                                    context: context,
                                    text: "Password is successfully reset!",
                                    isError: false,
                                  );
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ChangeNotifierProvider(
                                        create: (context) => LoginProvider(),
                                        child: const LoginScreen(),
                                      ),
                                    ),
                                  );
                                  return;
                                }
                                SnackBarMessage.showMessage(
                                  context: context,
                                  text: "Something went wrong",
                                  isError: true,
                                );

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
                      child: const Text("Back to forgot password"),
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
