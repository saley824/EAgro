import 'dart:developer';

import 'package:msan/models/api_response.dart';

import '../helpers/http_api.dart';
import '../models/address_model.dart';
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

  static Future<AddressModel?> getUserAddress({
    required String id,
  }) async {
    AddressModel? address;
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.get,
        'users/address/$id',
        body: {
          id: "id",
        },
      );
      address = AddressModel.fromJson(res.responseData);
    } catch (e) {
      log("EXCEPTION getUserAddressTAG : $e");
    }
    return address;
  }

  static Future<AddressModel?> getAddress({
    required String id,
  }) async {
    AddressModel? address;
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.get,
        'users/address/$id',
        body: {
          id: "id",
        },
      );
      address = AddressModel.fromJson(res.responseData);
    } catch (e) {
      log("EXCEPTION getUserAddressTAG : $e");
    }
    return address;
  }

  static Future<bool> updateAddress({
    required String id,
    required AddressModel address,
  }) async {
    ApiResponse? res;
    try {
      res = await HttpAPI.makeAPIcall(
        ApiMethod.put,
        'users/updateAddress',
        body: {
          "userId": id,
          "country": address.country,
          "city": address.city,
          "streetName": address.streetName,
          "streetNumber": address.streetNumber,
          "postalCode": address.postalCode,
        },
      );
    } catch (e) {
      log("EXCEPTION updateAddressTAG : $e");
    }

    return res?.success ?? false;
  }

  static Future<bool> addAddress({
    required String id,
    required AddressModel address,
  }) async {
    ApiResponse? res;
    try {
      res = await HttpAPI.makeAPIcall(
        ApiMethod.post,
        'users/addAddress',
        body: {
          "userId": id,
          "country": address.country,
          "city": address.city,
          "streetName": address.streetName,
          "streetNumber": address.streetNumber,
          "postalCode": address.postalCode,
        },
      );
    } catch (e) {
      log("EXCEPTION addAddressTAG : $e");
    }

    return res?.success ?? false;
  }

  static Future<bool> changePassword({
    required String oldPassword,
    required String password,
    required String confirmPassword,
    required String userId,
  }) async {
    ApiResponse? res;
    try {
      res = await HttpAPI.makeAPIcall(
        ApiMethod.post,
        'users/changePassword',
        body: {
          "oldPassword": oldPassword,
          "password": password,
          "confirmPassword": confirmPassword,
          "userId": userId,
        },
      );
    } catch (e) {
      log("EXCEPTION changePasswordTAG : $e");
    }

    return res?.success ?? false;
  }

  static Future<bool> forgotPassword({
    required String email,
  }) async {
    ApiResponse? res;
    try {
      res = await HttpAPI.makeAPIcall(
        ApiMethod.post,
        'users/forgotPassword',
        body: {
          "email": email,
        },
      );
    } catch (e) {
      log("EXCEPTION changePasswordTAG : $e");
    }

    return res?.success ?? false;
  }
}
