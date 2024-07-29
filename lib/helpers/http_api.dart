import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:msan/helpers/constants/shared_preferences_keys.dart';
import 'package:msan/helpers/helper_functions.dart';
import 'package:msan/helpers/snack_bar_messages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/models/api_response.dart';
import 'config/rest.dart';

enum ApiMethod {
  get,
  post,
  put,
  delete,
}

class HttpAPI {
  static BuildContext? _context;

  static set context(BuildContext value) => _context = _context ?? value;

  // static var isRefreshingTokenInProgress = false;

  /// The method [makeAPIcall] receives two mandatory params which are:
  ///
  /// [Enum] [ApiMethod], and [String] apiPath
  ///
  /// Params: body, contentType, headers, and [bool] authTokenRequired are optional
  ///
  /// The parameter authTokenRequired default value is set to true
  ///
  /// The method returns a future response of the [ApiResponse] type
  ///
  /// [ApiResponse] object contains information if the request was successful [bool] success
  ///
  /// [int] status code, [String] or [Null] errorMessage, and ([dynamic]/jsonObject) responseData
  HttpAPI({
    required BuildContext context,
  }) {
    _context = _context ?? context;
  }

  static Future<ApiResponse> makeAPIcall(
    ApiMethod method,
    String apiPath, {
    Object? body,
    String? contentType,
    Map<String, String>? initHeaders,
    bool authTokenRequired = false,
    // bool retryCall = true,
  }) async {
    try {
      var currentDateTime = DateTime.now().toLocal();
      var apiUri = Uri.parse("${RestConfig.ApiURL}$apiPath");

      log(
        "*****\nAPI-REQUEST: ${RestConfig.ApiURL}$apiPath\nREQUEST TIME: ${currentDateTime.hour.toString().padLeft(2, "0")}:${currentDateTime.minute.toString().padLeft(2, "0")}:${currentDateTime.second.toString().padLeft(2, "0")}\n*****",
        name: "HTTP API CALL",
      );
      var sharedPrefs = await SharedPreferences.getInstance();
      log(sharedPrefs.getString(SharedPrefsKeys.token)!);
      const timeout = Duration(seconds: 15);

      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader: contentType ?? 'application/json',
        if (authTokenRequired)
          HttpHeaders.authorizationHeader:
              'Bearer ${sharedPrefs.getString(SharedPrefsKeys.token)}',
        if (initHeaders != null) ...initHeaders
      };
      http.Response res;

      switch (method) {
        case ApiMethod.get:
          res = await http
              .get(
                apiUri,
                headers: headers,
              )
              .timeout(timeout);
          break;
        case ApiMethod.post:
          res = await http
              .post(
                apiUri,
                headers: headers,
                body: body == null ? null : jsonEncode(body),
              )
              .timeout(timeout);
          break;
        case ApiMethod.put:
          res = await http
              .put(
                apiUri,
                headers: headers,
                body: body == null ? null : jsonEncode(body),
              )
              .timeout(timeout);
          break;
        case ApiMethod.delete:
          res = await http
              .delete(
                apiUri,
                headers: headers,
                body: body == null ? null : jsonEncode(body),
              )
              .timeout(timeout);
          break;
      }

      var decodedRes = jsonDecode(res.body);

      ///This has to be changed according to the back-end response
      if (decodedRes['success']) {
        return ApiResponse(
          statusCode: res.statusCode,
          success: true,
          responseData: decodedRes['data'],
        );
      }

      if (!decodedRes['success']) {
        SnackBarMessage.showMessage(
            context: _context!, text: decodedRes["message"], isError: true);
      }

      ///Add refresh token logic here...
      ///if(res.statusCode == 401 && !refreshingTokenInProgress){ .... }

      log(
        "*********HEADERS********\n$method\nHEADERS:\n${jsonEncode(headers)}\n${body != null ? "****PAYLOAD****\n${jsonEncode(body)}" : ""}",
        error: "****$apiPath****\n${res.body}",
        name: "HTTP API CALL CRASH",
      );

      return ApiResponse(
        statusCode: res.statusCode,
        success: false,
        message: decodedRes['message'],
      );
    } catch (e) {
      log(
        "****/$apiPath****",
        error: e.toString(),
        name: "HTTP API CALL CRASH",
      );

      return ApiResponse(
        statusCode: 0,
        success: false,
        message: e.toString(),
      );
    }
  }
}
