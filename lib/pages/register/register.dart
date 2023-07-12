import 'package:course_application_mobile/pages/common_widgets.dart';
import 'package:course_application_mobile/pages/register/bloc/register_blocs.dart';
import 'package:course_application_mobile/pages/register/bloc/register_events.dart';
import 'package:course_application_mobile/pages/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          // backgroundColor: Colors.white,
          appBar: buildAppBar("Register"),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildTextField(
                              "Enter your first name", "text", "user.png", (value) {
                            context
                                .read<RegisterBlocs>()
                                .add(FirstNameEvent(value));
                          }),                          
                          buildTextField(
                              "Enter your last name", "text", "user.png", (value) {
                            context
                                .read<RegisterBlocs>()
                                .add(LastNameEvent(value));
                          }),
                          buildTextField(
                              "Enter your email", "email", "user.png", (value) {
                            context
                                .read<RegisterBlocs>()
                                .add(EmailEvent(value));
                          }),
                          buildTextField(
                              "Enter your password", "password", "lock.png",
                              (value) {
                            context
                                .read<RegisterBlocs>()
                                .add(PasswordEvent(value));
                          }),
                          buildTextField(
                              "Confirm your password", "password", "lock.png",
                              (value) {
                            context
                                .read<RegisterBlocs>()
                                .add(RePasswordEvent(value));
                          }),
                        ],
                      ),
                    ),                    
                      onTapTextLink("By creating an Account, you have to agree with our Privacy Policy."),
                    buildLoginandRegisterButton(
                      "Register",
                      "register",
                      () {
                        print("Register button");
                        RegisterController(context: context)
                            .handleEmailRegister();
                      },
                    ),
                    Center(child: reusableText("Or Register with")),
                    buildThirdPartyLogin(context),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(child: reusableText("Already have Account?")),
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
