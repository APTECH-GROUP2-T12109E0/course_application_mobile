import 'dart:convert';

import 'package:course_application_mobile/common/entities/entities.dart';
import 'package:course_application_mobile/common/values/colors.dart';
import 'package:course_application_mobile/common/values/message.dart';
import 'package:course_application_mobile/common/widgets/flutter_toast.dart';
import 'package:course_application_mobile/pages/register/bloc/register_events.dart';
import 'package:course_application_mobile/pages/sign_in/auth_blocs/auth_bloc.dart';
import 'package:course_application_mobile/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../common/apis/user_api.dart';
import '../../common/entities/msg.dart';
import '../../common/entities/user.dart';
import '../../common/values/constants.dart';
import '../../global.dart';
import '../home/home_controller.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleLogin(String type) async {
    EasyLoading.show(
        indicator: CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        dismissOnTap: true);
    try {
      if (type == "email") {
        //BLocProvider.of<SignInBloc>(context).state
        final state = context.read<SignInBloc>().state;

        try {
          var loginRes = await UserAPI.login(state.email, state.password);

          var userRes =
              await UserAPI.getUserProfileWithAccessToken(loginRes.accessToken);
          print("ok");

          if (userRes.email == null) {
            toastInfo(msg: "You don't exist");
            return;
          }

          if (userRes != null) {
            // UserProfileEntity userProfileEntity = UserProfileEntity();
            //
            // userProfileEntity.id = userRes.id;
            // userProfileEntity.type = userRes.type;
            // userProfileEntity.firstName = userRes.firstName;
            // userProfileEntity.lastName = userRes.lastName;
            // userProfileEntity.email = userRes.email;
            // userProfileEntity.avatar = userRes.avatar;
            // userProfileEntity.role = userRes.role;
            // userProfileEntity.status = userRes.status;
            // userProfileEntity.notify = userRes.notify;

            UserProfile userProfile = UserProfile();
            //type 1 means email login
            userProfile.access_token = loginRes.accessToken;
            userProfile.refresh_token = loginRes.refreshToken;
            userProfile.token = loginRes.accessToken;
            userProfile.firstName = userRes.firstName;
            userProfile.lastName = userRes.lastName;
            userProfile.avatar = userRes.avatar;
            userProfile.status = userRes.status;
            userProfile.type = userRes.type;
            userProfile.id = userRes.id;

            print("user existed");
            try {
              Global.storageService.setString(
                  AppConstants.STORAGE_USER_PROFILE_KEY,
                  jsonEncode(userProfile.toJson()));
              //used for authorization
              // Global.storageService.setString(
              //     AppConstants.STORAGE_USER_TOKEN_KEY, loginRes!.access_token);

              if (loginRes != null) {
                Global.storageService.setString(
                    AppConstants.STORAGE_USER_TOKEN_KEY, loginRes.accessToken);
              } else {
                print("saving token to local storage error");
              }

              if (context.mounted) {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("/application", (route) => false);
              }
            } catch (e) {
              print("saving local storage error ${e.toString()}");
            }

            if (context.mounted) {
              await HomeController(context: context).init();
            }
          } else {
            toastInfo(msg: "Currently you are not a user of this app");
            return;
          }
        } on Msg catch (e) {
          print(e.toString());
          toastInfo(msg: AppMessage.MESSAGE_GENERAL_FAILED);
        }
      }
    } catch (e) {
      print(e.toString());
      toastInfo(msg: AppMessage.MESSAGE_GENERAL_FAILED, textColor: AppColors.dangerColor);
    }
    EasyLoading.dismiss();
  }
}
