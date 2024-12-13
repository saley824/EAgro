import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/screens/login_screen/login_providers/login_provider.dart';
import '/screens/register_screen/register_providers/register_provider.dart';
import '/screens/register_screen/register_screen.dart';
import '/widgets/buttons/agro_button.dart';
import '/widgets/input_fields/agro_input_field.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final globalAppNavigator = Navigator.of(context);
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional.center,
                child: Column(
                  children: [
                    Text(
                      "Welcome too",
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
                      hintText: "Username",
                      labelVisible: true,
                      textEditingController: loginProvider.usernameController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AgroInputField(
                      onInputChanged: loginProvider.enableButton,
                      height: 48,
                      hintText: "Password",
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
                        text: "Login",
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                          ),
                          child: const Text("Forgot password?"),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
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
                          child: const Text("Create account"),
                        ),
                      ],
                    )
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
