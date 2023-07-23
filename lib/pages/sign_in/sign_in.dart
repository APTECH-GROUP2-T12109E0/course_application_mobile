import 'package:course_application_mobile/common/entities/entities.dart';
import 'package:course_application_mobile/common/values/colors.dart';
import 'package:course_application_mobile/common/values/helper.dart';
import 'package:course_application_mobile/common/values/message.dart';
import 'package:course_application_mobile/common/widgets/flutter_toast.dart';
import 'package:course_application_mobile/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:course_application_mobile/pages/sign_in/bloc/sign_in_events.dart';
import 'package:course_application_mobile/pages/sign_in/bloc/sign_in_states.dart';
import 'package:course_application_mobile/pages/sign_in/sign_in_controller.dart';
import 'package:course_application_mobile/pages/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              // backgroundColor: Colors.white,
              appBar: buildAppBar("Log in"),
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
                        Center(child: reusableText("Fast login with")),
                        buildThirdPartyLogin(context),
                        divider(),
                        Center(child: reusableText("Use your Account")),
                        Container(
                          margin: EdgeInsets.only(top: 30.h),
                          padding: EdgeInsets.only(left: 25.w, right: 25.w),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildTextFieldValidate(
                                  "Enter your email",
                                  "email",
                                  "user.png",
                                      (value) {
                                    context
                                        .read<SignInBloc>()
                                        .add(EmailEvent(value));
                                  },
                                      (value) {
                                    if (value == null || value.isEmpty) {
                                      return toastInfo(msg: AppMessage.MESSAGE_FIELD_REQUIRED);
                                    } else if (!Helper.isEmailValid(value)) {
                                      return toastInfo(msg: AppMessage.MESSAGE_EMAIL_INVALID);
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
                                        .read<SignInBloc>()
                                        .add(PasswordEvent(value));
                                  },
                                      (value) {
                                    if (value == null || value.isEmpty) {
                                      return toastInfo(msg: AppMessage.MESSAGE_FIELD_REQUIRED);
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTapTextLink("Forgot password?"),
                        buildLoginandRegisterButton(
                          "Log in",
                          "login",
                          () {
                            if (_formKey.currentState!.validate()) {
                              SignInController(context: context).handleLogin("email");
                            }
                            // LoginButtonPressed;
                            // Navigator.of(context).pushNamed("/home_page");
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Center(child: reusableText("Don't have Account?")),
                        buildLoginandRegisterButton(
                          "Register",
                          "register",
                          () {
                            // print("register button");
                            Navigator.of(context).pushNamed("/register");
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
      },
    );
  }
}


