import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:msan/screens/login_screen/login_model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

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
    final res = await LoginService.login(
      username: usernameController.text,
      password: passwordController.text,
    );
    if (res == null || !res.success) {
      return false;
    }

    final loginModel = LoginModel.fromJson(res.responseData);
    final sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString("access_token", loginModel.token);
    if (sharedPrefs.getString("access_token") != null) {
      log(sharedPrefs.getString("access_token")!);
    }

    return res.success;
  }

  Future<bool> autoLogin() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    var accessToken = sharedPrefs.getString("access_token");
    if (accessToken == null) {
      return false;
    }

    bool isAccessActive = false;
    if (!JwtDecoder.isExpired(accessToken)) {
      isAccessActive = true;
    }

    return isAccessActive;
  }
}
