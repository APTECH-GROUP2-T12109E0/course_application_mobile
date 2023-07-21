import 'dart:io' as IO;
import 'dart:io';

import 'package:course_application_mobile/common/entities/entities.dart';
import 'package:course_application_mobile/common/values/message.dart';
import 'package:course_application_mobile/common/widgets/flutter_toast.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

import '../../global.dart';
import '../values/constants.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() {
    return _instance;
  }

  late Dio dio;

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
        baseUrl: AppConstants.SERVER_API_URL,
        connectTimeout: const Duration(seconds: 120),
        receiveTimeout: const Duration(seconds: 120),
        headers: {},
        contentType: "application/json: charset=utf-8",
        responseType: ResponseType.json);
    dio = Dio(options);
    // ignore: deprecated_member_use
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
//     Dio dio = Dio(await _getOptions()); // Getting Headers and Other data

// if(!kIsWeb){
//   (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//       (IO.HttpClient client) {
//     client.badCertificateCallback =
//         (X509Certificate cert, String host, int port) => true;
//     return client;
//   };
// }
// return dio;
// }
  }

  Future<Response> get(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();

    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    if (data != null) {
      var headers = <String, dynamic>{};
      var accessToken = data['accessToken'];
      if (accessToken != null) {
        headers['Authorization'] = 'Bearer $accessToken';
        requestOptions.headers!.addAll(headers);
        requestOptions.contentType = "application/json";
      }
    }

    late Response response;
    try {
      response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
        options: requestOptions,
      );
    } catch (error) {
      if (error is DioError) {
        if (error.response?.statusCode == 403 ||
            error.response?.statusCode == 401) {
          bool isRefreshToken = await isRefreshTokenSuccess();
          if (isRefreshToken) {
            Options requestOptions = options ?? Options();
            requestOptions.headers = requestOptions.headers ?? {};
            _setAuthorizationHeaders(requestOptions);

            try {
              //Recall request
              response = await dio.get(
                path,
                data: data,
                queryParameters: queryParameters,
                options: requestOptions,
              );
            } catch (e) {
              print(e);
            }
          } else {
            Global.storageService.removeToken();
            toastInfo(msg: AppMessage.MESSAGE_TOKEN_INVALID);
          }
        }
      }
    }

    return response;
  }

  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    requestOptions.contentType = "application/json";

    late Response response;

    try {
      print("ok");
      response = await dio.post(path,
          data: data,
          queryParameters: queryParameters,
          options: requestOptions);
      print("done login");
    } catch (error) {
      if (error is DioError) {
        if (error.response?.statusCode == 403 ||
            error.response?.statusCode == 401) {
          bool isRefreshToken = await isRefreshTokenSuccess();
          if (isRefreshToken) {
            Options requestOptions = options ?? Options();
            requestOptions.headers = requestOptions.headers ?? {};
            _setAuthorizationHeaders(requestOptions);

            try {
              //Recall request
              response = await dio.post(path,
                  data: data,
                  queryParameters: queryParameters,
                  options: requestOptions);
            } catch (e) {
              print(e);
            }
          } else {
            Global.storageService.removeToken();
            toastInfo(msg: AppMessage.MESSAGE_TOKEN_INVALID);
          }
        }
      }
    }

    print("my response is ${response.toString()}");
    print("my status code is ${response.statusCode}");
    return response;
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    var accessToken = Global.storageService.getUserToken();
    if (accessToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }

  Future<bool> isRefreshTokenSuccess() async {
    var refreshToken = Global.storageService.getRefreshToken();
    try {
      var resRefresh = await dio.get("auth/refresh-token/$refreshToken");
      if (resRefresh.statusCode == 200) {
        RefreshTokenResponseEntity refreshTokenResponse =
            RefreshTokenResponseEntity.fromJson(resRefresh.data);
        if (refreshTokenResponse.type == 'success') {
          Global.storageService.setString(AppConstants.STORAGE_USER_TOKEN_KEY,
              refreshTokenResponse.accessToken!);
          Global.storageService.setString(
              AppConstants.STORAGE_USER_REFRESH_TOKEN_KEY,
              refreshTokenResponse.refreshToken!);
          return true;
        }
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  void _setAuthorizationHeaders(Options requestOptions) {
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers ??= {};
      requestOptions.headers!.addAll(authorization);
      requestOptions.contentType = "application/json";
    }
  }
}
