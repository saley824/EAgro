import 'package:flutter/material.dart';
import 'package:msan/helpers/helper_functions.dart';
import 'package:msan/screens/register_screen/register_screen.dart';
import 'package:msan/widgets/buttons/agro_button.dart';
import 'package:msan/widgets/input_fields/agro_input_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                    const SizedBox(height: 120),
                    const AgroInputField(
                      height: 48,
                      hintText: "Username",
                      labelVisible: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AgroInputField(
                      height: 48,
                      hintText: "Password",
                      labelVisible: true,
                      passwordField: true,
                    ),
                    const SizedBox(height: 4),
                    const SizedBox(
                      height: 20,
                    ),
                    const AgroButton(
                      text: "Login",
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
                                builder: (context) => const RegisterScreen(),
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
