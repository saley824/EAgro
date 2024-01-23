import 'package:flutter/material.dart';
import 'package:msan/screens/login_screen/login_screen.dart';

import '/helpers/helper_functions.dart';
import '/widgets/buttons/agro_button.dart';
import '/widgets/input_fields/agro_input_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final globalAppNavigator = Navigator.of(context);
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
                    const SizedBox(height: 20),
                    const AgroInputField(
                      hintText: "Name",
                      labelVisible: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AgroInputField(
                      hintText: "Last name",
                      labelVisible: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AgroInputField(
                      hintText: "Email",
                      labelVisible: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AgroInputField(
                      hintText: "Username",
                      labelVisible: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AgroInputField(
                      hintText: "Password",
                      labelVisible: true,
                      passwordField: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AgroInputField(
                      hintText: "Confirm password",
                      labelVisible: true,
                      passwordField: true,
                    ),
                    const SizedBox(height: 4),
                    const SizedBox(
                      height: 20,
                    ),
                    const AgroButton(text: "Create account"),
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
                                builder: (context) => const LoginScreen(),
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
            ],
          ),
        ),
      ),
    );
  }
}
