import 'package:flutter/material.dart';

import 'login_service.dart';

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

  Future<bool> login() async {
    return await LoginService.login(
      username: usernameController.text,
      password: passwordController.text,
    );
  }
}
