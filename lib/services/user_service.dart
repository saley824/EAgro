import 'dart:developer';

import '../helpers/http_api.dart';
import '../models/user_model.dart';

class UserService {
  static Future<UserModel?> getUser({
    required String id,
  }) async {
    UserModel? userModel;
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.get,
        'users/userInfo/$id',
        body: {
          id: "id",
        },
      );
      userModel = UserModel.fromJson(res.responseData["user"]);
    } catch (e) {
      log("EXCEPTION getUserTAG : $e");
    }
    return userModel;
  }
}
