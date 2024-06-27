import 'dart:developer';

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../helpers/http_api.dart';
import '/models/api_response.dart';

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

  static Future<bool> autoLogin() async {
    bool isAccessActive = false;

    final sharedPrefs = await SharedPreferences.getInstance();
    var accessToken = sharedPrefs.getString("access_token");
    if (accessToken == null) {
      isAccessActive = false;
    }

    if (accessToken != null && !JwtDecoder.isExpired(accessToken)) {
      isAccessActive = true;
    }
    await Future.delayed(const Duration(milliseconds: 3000));

    return isAccessActive;
  }
}
