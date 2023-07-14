import 'package:course_application_mobile/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastInfo(
    {required String msg,
    Color backgroundColor = Colors.redAccent,
    Color textColor = Colors.white}) {
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16.sp);
}
