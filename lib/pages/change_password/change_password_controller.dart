import 'package:course_application_mobile/common/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/apis/user_api.dart';
import '../../common/entities/user.dart';
import '../../common/values/message.dart';
import '../../common/widgets/flutter_toast.dart';
import '../../global.dart';
import 'bloc/change_password_bloc.dart';

class ChangePasswordController {
  final BuildContext context;
  UserProfile get userProfile => Global.storageService.getUserProfile();
  // String accesstoken = userProfile.access_token;
  const ChangePasswordController({required this.context});

  Future<void> init() async{
    var accessToken = userProfile.access_token;
    if(Global.storageService.getUserToken().isNotEmpty){
      var result = UserAPI.getUserProfileWithAccessToken(accessToken);
    }
  }

  Future<void> handleChangePassword() async {
    final state = context.read<ChangePassWordBlocs>().state;
    ChangePasswordRequestEntity changePasswordRequestEntity = ChangePasswordRequestEntity();
    changePasswordRequestEntity.oldPassword = state.oldPassword;
    changePasswordRequestEntity.password = state.password;
    changePasswordRequestEntity.confirmPassword = state.confirmPassword;

    try {
      ChangePasswordResponseEntity changePasswordResponseEntity =
      await UserAPI.changePassword(state.oldPassword, state.password, state.confirmPassword);
      // await UserAPI.changePassword(state.email);
      print("ok");

      if (changePasswordResponseEntity.statusCode == "200") {
        toastInfo(msg: "Change password Success! Please login again");
        Global.storageService.removeToken();
        Navigator.of(context).pushNamed(AppRoutes.SING_IN);
      }
    } catch (e) {
      print(e);
      toastInfo(msg: AppMessage.MESSAGE_GENERAL_FAILED);
    }
  }
}