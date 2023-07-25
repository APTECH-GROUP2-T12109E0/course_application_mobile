import 'dart:convert';

import 'package:course_application_mobile/pages/change_password/bloc/change_password_bloc.dart';
import 'package:course_application_mobile/pages/change_password/bloc/change_password_bloc.dart';
import 'package:course_application_mobile/pages/change_password/bloc/change_password_bloc.dart';
import 'package:course_application_mobile/pages/change_password/bloc/change_password_bloc.dart';
import 'package:course_application_mobile/pages/change_password/change_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/entities/user.dart';
import '../../common/values/helper.dart';
import '../../common/values/message.dart';
import '../../global.dart';
import '../common_widgets.dart';
import 'bloc/change_password_events.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    var userProfile = Global.storageService.getUserProfile();
    print("userProfile is ${jsonEncode(userProfile)}");
    context.read<ChangePassWordBlocs>().add(TriggerProfileName(userProfile));
  }
  UserProfile get userProfile => Global.storageService.getUserProfile();
  // UserProfile userProfile = UserProfile();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          // backgroundColor: Colors.white,
          appBar: buildAppBar("Change Password"),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 150.h),
                  child: Center(
                    child: Opacity(
                        opacity: 0.5,
                        child: Image.asset(
                          "assets/logo/logo_click_thumb_light.png",
                          fit: BoxFit.cover,
                          width: 300.w,
                          height: 300.h,
                        )),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 300.w,
                        height: 80.h,
                        child: Image.asset(
                            "assets/logo/logo_click_light_short.png"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildTextFieldValidate(
                              "Enter your old password",
                              "password",
                              "lock.png",
                                  (value) {
                                context
                                    .read<ChangePassWordBlocs>()
                                    .add(OldPasswordEvent(value));
                              },
                                  (value) {
                                if (value == null || value.isEmpty) {
                                  return AppMessage.MESSAGE_FIELD_REQUIRED;
                                }
                                return null;
                              },
                            ),
                            buildTextFieldValidate(
                              "Enter your password",
                              "password",
                              "lock.png",
                                  (value) {
                                context
                                    .read<ChangePassWordBlocs>()
                                    .add(PasswordEvent(value));
                              },
                                  (value) {
                                if (value == null || value.isEmpty) {
                                  return AppMessage.MESSAGE_FIELD_REQUIRED;
                                }
                                return null;
                              },
                            ),
                            buildTextFieldValidate(
                              "Confirm your password",
                              "password",
                              "lock.png",
                                  (value) {
                                context
                                    .read<ChangePassWordBlocs>()
                                    .add(ConfirmPasswordEvent(value));
                              },
                                  (value) {
                                if (value == null || value.isEmpty) {
                                  return AppMessage.MESSAGE_FIELD_REQUIRED;
                                }
                                if (value !=
                                    context
                                        .read<ChangePassWordBlocs>()
                                        .state
                                        .password) {
                                  return "Passwords do not match";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                    buildLoginandRegisterButton(
                      "Change Password",
                      "register",
                          () {
                        if (_formKey.currentState!.validate()) {
                          ChangePasswordController(context: context).handleChangePassword();
                        }
                      },
                    ),

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
