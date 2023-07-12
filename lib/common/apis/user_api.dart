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
    var response =
        await HttpUtil().post('auth/login', mydata: data);

    return UserLoginResponseEntity.fromJson(response);
  }
}
