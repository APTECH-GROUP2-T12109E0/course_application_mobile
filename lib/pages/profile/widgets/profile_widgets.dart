import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/routes/route_name.dart';
import '../../../common/values/colors.dart';
import '../../../common/widgets/base_text_widgets.dart';
import '../../../common/widgets/flutter_toast.dart';

AppBar buildAppbar() {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Container(
      margin: EdgeInsets.only(left: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: 30.w,
              height: 30.h,
              child: Image.asset("assets/logo/logo_click_thumb_light50.png")),
          reusableText("Profile"),
          SizedBox(
              width: 50.w,
              height: 24.h,
              child: Image.asset("assets/logo/logo_click_light_short.png")),
        ],
      ),
    ),
  );
}

//profile icon and edit button
Widget profileIconAndEditButton(String avatar) {
  return Container(
    alignment: Alignment.bottomRight,
    padding: EdgeInsets.only(right: 6.w),
    width: 80.w,
    height: 80.h,

    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        image: DecorationImage(
            image: NetworkImage(avatar))),
    child: Image(
      width: 25.w,
      height: 25.h,
      image: const AssetImage("assets/icons/edit_3.png"),
    ),
  );
}

Widget profilePageText(String text,
    {Color color = AppColors.primaryColor, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style:
      TextStyle(color: color, fontSize: 24.sp, fontWeight: FontWeight.bold),
    ),
  );
}

//setting sections buttons
var imagesInfo =<String, String>{
  "Settings":"settings.png",
  "Payment details":"credit-card.png",
  "Achievement":"award.png",
  "Reminders":"cube.png",
  "Change Password":"edit.png"
};


Widget buildListView(BuildContext context){
  return Column(
    children: [
      ...List.generate(imagesInfo.length, (index) => GestureDetector(
        onTap: () {
          if(index==0){
            Navigator.of(context).pushNamed(AppRoutes.SETTINGS);
          } else if(index==1){
            toastInfo(msg: "This feature is on developing");
          }else if(index==2){
            toastInfo(msg: "This feature is on developing");
          }else if(index==3){
            toastInfo(msg: "This feature is on developing");
          }else if(index==4){
            Navigator.of(context).pushNamed(AppRoutes.FORGET_PASSWORD);
          }


        },

        child: Container(
          margin: EdgeInsets.only(bottom: 15.h),
          child: Row(
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                padding: EdgeInsets.all(7.0.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    color: AppColors.primaryElement),
                child: Image.asset("assets/icons/${imagesInfo.values.elementAt(index)}"),
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(imagesInfo.keys.elementAt(index),
                  style: TextStyle(
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp))
            ],
          ),
        ),
      ),)

    ],
  );
}

Widget buildRowView (BuildContext context){
  return Container(
    margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
    padding: EdgeInsets.only(left: 40.w, right: 40.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _actionButton("icons/profile_video.png", "My Courses", () { print("my course tapped"); Navigator.of(context).pushNamed(AppRoutes.MY_COURSES); }),
        _actionButton("icons/profile_book.png", "Blog", () { toastInfo(msg: "This feature is on developing");}),
        _actionButton("icons/message-square.png", "Message", () { toastInfo(msg: "This feature is on developing");}),
      ],
    ),
  );
}

Widget _actionButton(String imagePath, String itemName, void Function()? function){
  return GestureDetector(
    onTap: function,
    child: Container(
      width: 80.w,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        boxShadow: [BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 3,
          offset: Offset(0,3),
        )],
        borderRadius: BorderRadius.circular(10.w),
        border: Border.all(color: AppColors.primaryColor),
      ),
      child: Column(
        children: [
          SizedBox(width: 20.w, height: 20.h, child: Image.asset("assets/${imagePath}"),),
          Container(
            child: reusableText(itemName, fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),
          )
        ],
      ),
    ),
  );
}
