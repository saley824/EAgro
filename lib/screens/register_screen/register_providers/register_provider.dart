import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  final firstNameController = TextEditingController(text: "");
  final lastNameController = TextEditingController(text: "");
  final emailController = TextEditingController(text: "");
  final usernameController = TextEditingController(text: "");
  final passwordController = TextEditingController(text: "");
  final confirmPasswordController = TextEditingController(text: "");
  bool isButtonEnabled = false;

  void enableButton() {
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        arePasswordMatched()) {
      isButtonEnabled = true;
      notifyListeners();
      return;
    }
    isButtonEnabled = false;
    notifyListeners();
  }

  bool arePasswordMatched() {
    return passwordController.text == confirmPasswordController.text;
  }
  // bool isValidEmail(String email) {
  //   // Define a regular expression for a valid email address
  //   final RegExp emailRegex = RegExp(
  //     r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  //   );
  //   // Check if the provided email matches the regular expression
  //   return emailRegex.hasMatch(email);
  // }

  // bool isPasswordValid(String email) {
  //   // Define a regular expression for a valid email address
  //   final RegExp passwordRegex = RegExp(
  //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
  //   );
  //   // Check if the provided email matches the regular expression
  //   return passwordRegex.hasMatch(email);
  // }
}
