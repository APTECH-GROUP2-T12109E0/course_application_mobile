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
      var response = await HttpUtil().post('auth/login', mydata: data);

      if (response.statusCode == 200) {
        return UserLoginResponseEntity.fromJson(response.data);
      } else {
        throw Exception('Something was wrong');
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response!.statusCode == 400) {
          var errorData = e.response!.data as Map<String, dynamic>;
          var message = errorData['message'];
          toastInfo(msg: 'Bad Request: ${message ?? "Some thing was wrong"}');
          throw Exception(message);
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
      print("ok");

      if (response.statusCode == 200) {
        return UserProfileEntity.fromJson(response.data);
      } else {
        throw Exception('Something was wrong');
      }
    } catch (e) {
      throw Exception('Request failed: $e');
    }
  }
}
