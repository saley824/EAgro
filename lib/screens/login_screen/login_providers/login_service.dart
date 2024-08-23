import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

import '../../../helpers/http_api.dart';
import '../login_screen.dart';
import '/models/api_response.dart';
import 'login_provider.dart';

class LoginService {
  static Future<ApiResponse?> login({
    required String username,
    required String password,
  }) async {
    ApiResponse? apiResponse;
    try {
      apiResponse = await HttpAPI.makeAPIcall(
        ApiMethod.post,
        'users/login',
        body: {
          "username": username,
          "password": password,
        },
      );
    } catch (e) {
      log("EXCEPTION loginTAG : $e");
    }
    return apiResponse;
  }

  static Future<Tuple2<bool, String?>> autoLogin() async {
    bool isAccessActive = false;
    String? token;

    final sharedPrefs = await SharedPreferences.getInstance();
    var accessToken = sharedPrefs.getString("access_token");

    if (accessToken == "") {
      return Tuple2(false, token);
    }

    if (accessToken == null) {
      isAccessActive = false;
    }

    if (accessToken != null && !JwtDecoder.isExpired(accessToken)) {
      isAccessActive = true;
      token = accessToken;
    }

    return Tuple2(isAccessActive, token);
  }

  static void logOut(BuildContext context) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString("access_token", "");
    if (context.mounted) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                    create: (BuildContext context) => LoginProvider(),
                    child: const LoginScreen(),
                  )),
          (Route<dynamic> route) => false);
    }
  }
}
