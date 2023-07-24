
import 'package:course_application_mobile/common/entities/course.dart';
import 'package:course_application_mobile/pages/checkout/bloc/checkout_states.dart';
import 'package:course_application_mobile/pages/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';


Widget checkoutInfo(BuildContext context, CheckoutDetailStates state){
  // final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
  // var courseId = args['id'];

  return Stack(
    children: [
      Container(
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
            margin: EdgeInsets.symmetric(horizontal: 70.w),
            width: 300.w,
            height: 200.h,
            color: Colors.white.withOpacity(0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                itemInfo("Your First name", "value"),
                itemInfo("Your Last name", "value"),
                itemInfo("Course name", "value"),
                itemInfo("Price", "value"),
                itemInfo("Payment method", "value"),
              ],
            ),
          ),
         

          buildLoginandRegisterButton(
            "Checkout",
            "register",
                () {
              // print("register button");
              Navigator.of(context).pushNamed("/register");
            },
          ),
        ],
      ),
    ],
  );
}

Widget itemInfo(String item, String value){
  return Row(
    children: [
      Text("${item} :"),

      Text(" ${value}"),
    ],
  );
}


