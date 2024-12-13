import 'dart:developer';

import 'package:eagro/helpers/helper_functions.dart';
import 'package:eagro/helpers/snack_bar_messages.dart';
import 'package:eagro/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

import '../../../helpers/http_api.dart';
import '../../../providers/main_provider.dart';
import '../login_screen.dart';
import '/models/api_response.dart';
import 'login_provider.dart';

class LoginService {
  static Future<ApiResponse?> login({
    required String username,
    required String password,
    required String fcmToken,
  }) async {
    ApiResponse? apiResponse;
    try {
      apiResponse = await HttpAPI.makeAPIcall(
        ApiMethod.post,
        'users/login',
        body: {
          "username": username,
          "password": password,
          "fcmToken": fcmToken,
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
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    HelperFunctions.callMethodWithLoadingDialog(
        context: context,
        callback: () async {
          final sharedPrefs = await SharedPreferences.getInstance();
          await UserService.logOut(id: mainProvider.getId());
          sharedPrefs.setString("access_token", "");
        },
        onFinished: () {
          if (context.mounted) {
            SnackBarMessage.showMessage(context: context, text: "Uspješno ste se odjavili!", isError: false);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                          create: (BuildContext context) => LoginProvider(),
                          child: const LoginScreen(),
                        )),
                (Route<dynamic> route) => false);
          }
        });

  }
}
