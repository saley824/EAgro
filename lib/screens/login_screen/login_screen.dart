import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/helpers/helper_functions.dart';
import '/helpers/navigator_helper.dart';
import '/screens/forgot_password/forgot_password_screen.dart';
import '/screens/login_screen/login_providers/login_provider.dart';
import '/screens/register_screen/register_providers/register_provider.dart';
import '/screens/register_screen/register_screen.dart';
import '/widgets/buttons/agro_button.dart';
import '/widgets/input_fields/agro_input_field.dart';
import '../../helpers/snack_bar_messages.dart';
import '../forgot_password/forgot_password_providers/forgot_password_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final globalAppNavigator = Navigator.of(context);
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
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
                      "Dobrodošli na",
                      style: textTheme.headlineMedium!
                          .copyWith(color: Colors.black),
                    ),
                    Text(
                      "EAgro Shop",
                      style: textTheme.headlineLarge!
                          .copyWith(color: Colors.black),
                    ),
                    const SizedBox(height: 120),
                    AgroInputField(
                      onInputChanged: loginProvider.enableButton,
                      height: 48,
                      hintText: "Korisničko ime",
                      labelVisible: true,
                      textEditingController: loginProvider.usernameController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AgroInputField(
                      onInputChanged: loginProvider.enableButton,
                      height: 48,
                      hintText: "Šifra",
                      labelVisible: true,
                      passwordField: true,
                      textEditingController: loginProvider.passwordController,
                    ),
                    const SizedBox(height: 4),
                    const SizedBox(
                      height: 20,
                    ),
                    Consumer<LoginProvider>(
                      builder: (_, __, ___) => AgroButton(
                        disabled: !loginProvider.isButtonEnabled,
                        text: "Prijavi se",
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          bool success = false;
                          HelperFunctions.callMethodWithLoadingDialog(
                              context: context,
                              callback: () async {
                                success = await loginProvider.login(context);
                              },
                              onFinished: () {
                                if (success) {
                                  SnackBarMessage.showMessage(
                                      context: context,
                                      text: "Uspješno ste prijavljeni!",
                                      isError: false);

                                  NavigatorHelper.navigateToHome(context);

                                  return;
                                }
                                SnackBarMessage.showMessage(
                                    context: context,
                                    text: "Pogrešno korisničko ime ili šifra!",
                                    isError: true);
                                return;
                              });
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            NavigatorHelper.navigateToForgotPassword(context);
                            ChangeNotifierProvider(
                              create: (context) => ForgotPasswordProvider(),
                              child: const ForgotPasswordScreen(),
                            );
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                          ),
                          child: const Text("Zaboravili ste šifru?"),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Nemate nalog?",
                          style: textTheme.bodyLarge,
                        ),
                        TextButton(
                          onPressed: () {
                            globalAppNavigator.push(
                              MaterialPageRoute(
                                builder: (context) => ChangeNotifierProvider(
                                  create: (context) => RegisterProvider(),
                                  child: const RegisterScreen(),
                                ),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.all(4)),
                          child: const Text("Kreirajte nalog"),
                        ),
                      ],
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
