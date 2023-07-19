import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/colors.dart';

Widget reusableText(String text,
    {Color color = AppColors.primaryText,
      double fontSize = 16, FontWeight fontWeight=FontWeight.bold, TextAlign textAlign=TextAlign.left}) {
  return Text(
    text,
    style: TextStyle(
        color: color, fontWeight: fontWeight, fontSize: fontSize.sp),
  );
}
Widget reusableNum(int num,
    {Color color = AppColors.primaryText,
      double fontSize = 16, FontWeight fontWeight=FontWeight.bold, TextAlign textAlign=TextAlign.left}) {
  return Text(
    num.toString(),
    style: TextStyle(
        color: color, fontWeight: fontWeight, fontSize: fontSize.sp),
  );
}

AppBar buildAppBar(String url) {
  return AppBar(
    iconTheme: const IconThemeData(color: Colors.black),
    title: reusableText(url),
  );
}