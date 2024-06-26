import 'dart:developer';

import '../../../helpers/http_api.dart';

class LoginService {
  static Future<bool> login({
    required String username,
    required String password,
  }) async {
    bool success = false;
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.post,
        'users/login',
        body: {
          "username": username,
          "password": password,
        },
      );
      success = res.success;
    } catch (e) {
      log("EXCEPTION loginTAG : $e");
    }
    return success;
  }
}
