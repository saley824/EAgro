import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/address_model.dart';
import '../../../models/user_model.dart';
import '../../../providers/main_provider.dart';
import '../../../services/user_service.dart';
import '/screens/login_screen/login_model/login_model.dart';
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

  Future<bool> login(BuildContext context) async {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);

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
    var decodedToken = JwtDecoder.decode(loginModel.token);
    UserModel? userModel =
        await UserService.getUser(id: decodedToken["id"].toString());
    AddressModel? address =
        await UserService.getUserAddress(id: decodedToken["id"].toString());
    mainProvider.user = userModel;
    mainProvider.user?.address = address;

    await Future.delayed(const Duration(milliseconds: 1000));

    return res.success;
  }

  // Future<bool> autoLogin() async {
  //   final sharedPrefs = await SharedPreferences.getInstance();
  //   var accessToken = sharedPrefs.getString("access_token");
  //   if (accessToken == null) {
  //     return false;
  //   }

  //   bool isAccessActive = false;
  //   if (!JwtDecoder.isExpired(accessToken)) {
  //     isAccessActive = true;
  //   }

  //   return isAccessActive;
  // }
}
