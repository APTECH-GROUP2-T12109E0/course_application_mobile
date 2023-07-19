import 'package:course_application_mobile/common/values/message.dart';
import 'package:course_application_mobile/common/widgets/flutter_toast.dart';
import 'package:dio/dio.dart';

import '../entities/user.dart';
import '../utils/http_util.dart';

class UserAPI {
  static login(String? email, String? password,
      {LoginRequestEntity? params}) async {
    //response = response.data after the post method returns
    var data = {
      "email": email,
      "password": password,
    };

    try {
      var response = await HttpUtil().post('auth/login', data: data);

      if (response.statusCode == 200) {
        return UserLoginResponseEntity.fromJson(response.data);
      } else {
        throw Exception(AppMessage.MESSAGE_GENERAL_FAILED);
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response!.statusCode == 400) {
          var errorData = e.response!.data as Map<String, dynamic>;
          var message = errorData['message'];
          toastInfo(msg: '${message ?? AppMessage.MESSAGE_GENERAL_FAILED}');
          return false;
        }else if(e.response != null && e.response!.statusCode == 404) {
          var errorData = e.response!.data as Map<String, dynamic>;
          var message = errorData['message'];
          toastInfo(msg: '${message ?? AppMessage.MESSAGE_GENERAL_FAILED}');
          return false;
        } else {
          print('Request failed: $e');
          throw Exception('Request failed: $e');
        }
      } else {
        print('Request failed: $e');
        throw Exception('Request failed: $e');
      }
    }
  }

  static register(String? firstName, String? lastName, String? email, String? password,
      {LoginRequestEntity? params}) async {

    var data = {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password,
    };

    try {
      var response = await HttpUtil().post('auth/register', data: data);

      if (response.statusCode == 200) {
        return RegisterResponseEntity.fromJson(response.data);
      } else {
        throw Exception(AppMessage.MESSAGE_GENERAL_FAILED);
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response!.statusCode == 400) {
          var errorData = e.response!.data as Map<String, dynamic>;
          var message = errorData['message'];
          toastInfo(msg: '${message ?? AppMessage.MESSAGE_GENERAL_FAILED}');
          return false;
        }else if(e.response != null && e.response!.statusCode == 404) {
          var errorData = e.response!.data as Map<String, dynamic>;
          var message = errorData['message'];
          toastInfo(msg: '${message ?? AppMessage.MESSAGE_GENERAL_FAILED}');
          return false;
        } else {
          print('Request failed: $e');
          throw Exception('Request failed: $e');
        }
      } else {
        print('Request failed: $e');
        throw Exception('Request failed: $e');
      }
    }
  }

  static getUserProfileWithAccessToken(String? accessToken) async {
    try {
      var data = {
        "accessToken": accessToken,
      };
      var response = await HttpUtil().get('auth/user/me', data: data);

      if (response.statusCode == 200) {
        return UserProfileEntity.fromJson(response.data);
      } else {
        throw Exception(AppMessage.MESSAGE_GENERAL_FAILED);
      }
    } catch (e) {
      throw Exception('Request failed: $e');
    }
  }

  // static testAccess(String? accessToken) async {
  //   var data = {
  //     "accessToken": accessToken,
  //   };
  //   var response = await HttpUtil().get('auth/user', data: data);
  //   print("ok rui nha");
  //
  //   if (response.statusCode == 200) {
  //     return UserProfileEntity.fromJson(response.data);
  //   } else {
  //     throw Exception(AppMessage.MESSAGE_GENERAL_FAILED);
  //   }
  // }
}
