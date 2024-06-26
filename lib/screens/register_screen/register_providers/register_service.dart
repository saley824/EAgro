import 'dart:developer';

import '../../../helpers/http_api.dart';

class RegisterService {
  static Future<bool> signUp({
    required String name,
    required String lastName,
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    bool success = false;
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.post,
        'users/signUp',
        body: {
          "name": name,
          "lastName": lastName,
          "email": email,
          "username": userName,
          "password": password,
          "confirmPassword": confirmPassword,
        },
      );
      success = res.success;
    } catch (e) {
      log("EXCEPTION registerUserTAG : $e");
    }
    return success;
  }
}
