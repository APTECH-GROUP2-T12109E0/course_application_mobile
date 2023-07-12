import 'dart:convert';

import 'package:course_application_mobile/common/entities/entities.dart';
import 'package:course_application_mobile/common/widgets/flutter_toast.dart';
import 'package:course_application_mobile/pages/register/bloc/register_events.dart';
import 'package:course_application_mobile/pages/sign_in/auth_blocs/auth_bloc.dart';
import 'package:course_application_mobile/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../common/apis/user_api.dart';
import '../../common/entities/msg.dart';
import '../../common/entities/msg.dart';
import '../../common/entities/user.dart';
import '../../common/values/constants.dart';
import '../../global.dart';
import '../home/home_controller.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        //BLocProvider.of<SignInBloc>(context).state
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          //
          toastInfo(msg: "You need to fill email address");
          return;
        }
        if (password.isEmpty) {
          //
          toastInfo(msg: "You need to fill password");
          return;
        }

        try {
          final result = await UserAPI.login(emailAddress, password);
          if (result.user == null) {
            //
            toastInfo(msg: "You don't exist");
            return;
          }
          if (!result.user!.emailVerified) {
            toastInfo(msg: "You need to verify your email account");
            return;
          }

          var user = result.user;
          if (user != null) {
            String? firstName = user.firstName;
            String? email = user.email;
            // String? id = user.uid;
            String? photoUrl = user.photoURL;
            UserProfileEntity userProfileEntity = UserProfileEntity();

            userProfileEntity.avatar = photoUrl;
            userProfileEntity.lastName = firstName;
            userProfileEntity.email = email;
            // userProfileEntity.open_id = id;
            //type 1 means email login
            userProfileEntity.type = 1;

            print("user exist");
            await asyncPostAllData(userProfileEntity);
            if (context.mounted) {
              await HomeController(context: context).init();
            }
          } else {
            toastInfo(msg: "Currently you are not a user of this app");
            return;
            //we have error getting user from firebase
          }
        } on Msg catch (e) {
          print(e.toString());
          // if (e.Msg == 'user-not-found') {
          //   print('No user found for that email.');
          //   toastInfo(msg: "No user found for that email");
          //   // toastInfo(msg: "No user found for that email.");
          // } else if (e.code == 'wrong-password') {
          //   print('Wrong password provided for that user.');
          //   toastInfo(msg: "Wrong password provided for that user");
          //   // toastInfo(msg: "Wrong password provided for that user.");
          // } else if (e.code == 'invalid-email') {
          //   print("Your email format is wrong");
          //   toastInfo(msg: "Your email address format is wrong");
          // }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> asyncPostAllData(UserProfileEntity userProfileEntity) async {
    final state = context.read<SignInBloc>().state;
    String emailAddress = state.email;
    String password = state.password;
    EasyLoading.show(
        indicator: CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        dismissOnTap: true);
    var result = await UserAPI.login(emailAddress, password);
    // var result = await UserAPI.login(params: LoginRequestEntity());
    if (result.code == 200) {
      try {
        Global.storageService.setString(
            AppConstants.STORAGE_USER_PROFILE_KEY, jsonEncode(result.data!));
        print("......my token is ${result.data!.access_token!}.......");
        //used for authorization
        Global.storageService.setString(
            AppConstants.STORAGE_USER_TOKEN_KEY, result.data!.access_token!);
        EasyLoading.dismiss();

        if (context.mounted) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil("/application", (route) => false);
        }
      } catch (e) {
        print("saving local storage error ${e.toString()}");
      }
    } else {
      EasyLoading.dismiss();
      toastInfo(msg: "unknown error");
    }
  }
}
