import 'package:course_application_mobile/common/values/message.dart';
import 'package:course_application_mobile/pages/common_widgets.dart';
import 'package:course_application_mobile/pages/reset_password/bloc/reset_password_blocs.dart';
import 'package:course_application_mobile/pages/reset_password/bloc/reset_password_events.dart';
import 'package:course_application_mobile/pages/reset_password/reset_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          // backgroundColor: Colors.white,
          appBar: buildAppBar("Reset Password"),
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
                              "Enter new password",
                              "password",
                              "lock.png",
                                  (value) {
                                context
                                    .read<ResetPasswordBlocs>()
                                    .add(NewPasswordEvent(value));
                              },
                                  (value) {
                                if (value == null || value.isEmpty) {
                                  return AppMessage.MESSAGE_FIELD_REQUIRED;
                                }
                                return null;
                              },
                            ),
                            buildTextFieldValidate(
                              "Confirm new password",
                              "password",
                              "lock.png",
                                  (value) {
                                context
                                    .read<ResetPasswordBlocs>()
                                    .add(ConfirmPasswordEvent(value));
                              },
                                  (value) {
                                if (value == null || value.isEmpty) {
                                  return AppMessage.MESSAGE_FIELD_REQUIRED;
                                }
                                if (value !=
                                    context
                                        .read<ResetPasswordBlocs>()
                                        .state
                                        .newPassword) {
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
                      "Change", // Change button text
                      "register",
                          () {
                        if (_formKey.currentState!.validate()) {
                          ResetPasswordController(context: context).handleResetPassword();
                        }
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(child: reusableText("Or Register with")),
                    buildThirdPartyLogin(context),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(child: reusableText("Already have an Account?")),
                    buildLoginandRegisterButton(
                      "Log In",
                      "login",
                          () {
                        // print("register button");
                        Navigator.of(context).pushNamed("sign_in");
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
