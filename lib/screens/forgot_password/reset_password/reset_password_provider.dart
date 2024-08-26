import 'package:flutter/material.dart';

import '../../../services/user_service.dart';

class ResetPasswordProvider extends ChangeNotifier {
  final tokenController = TextEditingController(text: "");
  final passwordController = TextEditingController(text: "");
  final confirmPasswordController = TextEditingController(text: "");

  bool isButtonEnabled = false;

  Future<bool> resetPassword() async {
    bool success = false;
    success = await UserService.resetPassword(
      token: tokenController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
    );
    return success;
  }

  void enableButton() {
    isButtonEnabled = tokenController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty;
    notifyListeners();
  }
}
