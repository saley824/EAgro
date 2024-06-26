import 'package:flutter/material.dart';
import 'package:msan/helpers/snack_bar_messages.dart';
import 'package:provider/provider.dart';

import '/helpers/helper_functions.dart';
import '/screens/login_screen/login_providers/login_provider.dart';
import '/screens/login_screen/login_screen.dart';
import '/screens/register_screen/register_providers/register_provider.dart';
import '/widgets/buttons/agro_button.dart';
import '/widgets/input_fields/agro_input_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final globalAppNavigator = Navigator.of(context);
    final registerProvider =
        Provider.of<RegisterProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                gradient: HelperFunctions.getBackGroundGradient(),
              ),
              child: Column(
                children: [
                  Text(
                    "Welcome to",
                    style:
                        textTheme.headlineMedium!.copyWith(color: Colors.black),
                  ),
                  Text(
                    "Agro Shop",
                    style:
                        textTheme.headlineLarge!.copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 20),
                  AgroInputField(
                    hintText: "First name",
                    labelVisible: true,
                    textEditingController: registerProvider.firstNameController,
                    onInputChanged: registerProvider.enableButton,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AgroInputField(
                    hintText: "Last name",
                    labelVisible: true,
                    textEditingController: registerProvider.lastNameController,
                    onInputChanged: registerProvider.enableButton,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AgroInputField(
                    hintText: "Email",
                    labelVisible: true,
                    textEditingController: registerProvider.emailController,
                    onInputChanged: registerProvider.enableButton,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AgroInputField(
                    hintText: "Username",
                    labelVisible: true,
                    textEditingController: registerProvider.usernameController,
                    onInputChanged: registerProvider.enableButton,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AgroInputField(
                    hintText: "Password",
                    labelVisible: true,
                    passwordField: true,
                    textEditingController: registerProvider.passwordController,
                    onInputChanged: registerProvider.enableButton,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AgroInputField(
                    hintText: "Confirm password",
                    labelVisible: true,
                    passwordField: true,
                    textEditingController:
                        registerProvider.confirmPasswordController,
                    onInputChanged: registerProvider.enableButton,
                  ),
                  const SizedBox(height: 4),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer<RegisterProvider>(
                    builder: (_, __, ___) => AgroButton(
                        text: "Create account",
                        disabled: !registerProvider.isButtonEnabled,
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          bool success = false;
                          HelperFunctions.callMethodWithLoadingDialog(
                              context: context,
                              callback: () async {
                                success = await registerProvider.signUp();
                              },
                              onFinished: () {
                                if (success) {
                                  SnackBarMessage.showMessage(
                                      context: context,
                                      text: "Successfully registered",
                                      isError: false);
                                  return;
                                }
                                SnackBarMessage.showMessage(
                                    context: context,
                                    text: "Errorcina",
                                    isError: true);
                                return;
                              });
                        }),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: textTheme.bodyLarge,
                      ),
                      TextButton(
                        onPressed: () {
                          globalAppNavigator.push(
                            MaterialPageRoute(
                              builder: (context) => ChangeNotifierProvider(
                                create: (context) => LoginProvider(),
                                child: const LoginScreen(),
                              ),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.all(4)),
                        child: const Text("Login"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
