import 'dart:developer';

import 'package:msan/models/api_response.dart';

import '../../../helpers/http_api.dart';

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
}
