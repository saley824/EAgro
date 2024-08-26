import 'package:flutter/material.dart';
import 'package:msan/services/user_service.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  bool isButtonEnabled = false;
  final emailController = TextEditingController(text: "");

  Future<bool> forgotPassword() async {
    bool success = false;
    success = await UserService.forgotPassword(email: emailController.text);
    return success;
  }

  void enableButton() {
    isButtonEnabled = emailController.text.isNotEmpty;
    notifyListeners();
  }
}
