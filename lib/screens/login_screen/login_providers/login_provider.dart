import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final usernameController = TextEditingController(text: "");
  final passwordController = TextEditingController(text: "");
  bool isButtonEnabled = false;

  void enableButton() {
    //  error = "";
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      isButtonEnabled = true;
      notifyListeners();
      return;
    }
    isButtonEnabled = false;
    notifyListeners();
  }
}
