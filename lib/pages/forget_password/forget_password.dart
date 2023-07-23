import 'package:course_application_mobile/common/values/helper.dart';
import 'package:course_application_mobile/common/values/message.dart';
import 'package:course_application_mobile/pages/common_widgets.dart';
import 'package:course_application_mobile/pages/forget_password/bloc/forget_password_blocs.dart';
import 'package:course_application_mobile/pages/forget_password/bloc/forget_password_events.dart';
import 'package:course_application_mobile/pages/forget_password/forget_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar("Forgot Password"),
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
                      ),
                    ),
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
                          "assets/logo/logo_click_light_short.png",
                        ),
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
                              "Enter your email", // Change field label
                              "email", // Change field type to "email"
                              "user.png",
                                  (value) {
                                context.read<ForgetPasswordBlocs>().add(EmailEvent(value));
                              },
                                  (value) {
                                if (value == null || value.isEmpty) {
                                  return AppMessage.MESSAGE_FIELD_REQUIRED;
                                }
                                if (!Helper.isEmailValid(value)) {
                                  return AppMessage.MESSAGE_EMAIL_INVALID;
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    buildLoginandRegisterButton(
                      "Send", // Change button text
                      "register",
                          () {
                        if (_formKey.currentState!.validate()) {
                          ForgetPasswordController(context: context).handleForgotPassword();
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
                        Navigator.of(context).pushNamed("sign_in");
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
