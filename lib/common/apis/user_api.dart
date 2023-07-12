import '../entities/user.dart';
import '../utils/http_util.dart';

class UserAPI{
 static login(String? email, String? password, {LoginRequestEntity? params}) async {
   //response = response.data after the post method returns
    var response = await HttpUtil().post(
      'auth/login',
      queryParameters:params?.toJson()
    );

   return UserLoginResponseEntity.fromJson(response);
  }
}
