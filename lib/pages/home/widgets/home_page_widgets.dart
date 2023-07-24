import 'package:course_application_mobile/common/entities/entities.dart';
import 'package:course_application_mobile/common/widgets/flutter_toast.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:course_application_mobile/common/values/colors.dart';

import 'package:course_application_mobile/pages/home/bloc/home_page_blocs.dart';
import 'package:course_application_mobile/pages/home/bloc/home_page_events.dart';
import 'package:course_application_mobile/pages/home/bloc/home_page_states.dart';

import '../../../common/entities/course.dart';
import '../../../common/values/constants.dart';
import '../../../common/widgets/base_text_widgets.dart';


AppBar buildAppBar(String avatar) {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 150.w,
            height: 50.h,
            child: Image.asset("assets/logo/logo_click_light.png", fit: BoxFit.fitWidth),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration:  BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(avatar))),
            ),
          )
        ],
      ),
    ),
  );
}

//reusable big text widget
Widget homePageText(String text,
    {Color color = AppColors.infoColor, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style:
      TextStyle(color: color, fontSize: 24.sp, fontWeight: FontWeight.bold),
    ),
  );
}

Widget searchView() {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: AppColors.lightColor,
            borderRadius: BorderRadius.circular(15.h),
            border: Border.all(color: AppColors.primaryFourElementText)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              width: 16.w,
              height: 16.w,
              child: Image.asset("assets/icons/search.png"),
            ),
            Container(
              width: 240.w,
              height: 40.h,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                  hintText: "search your course",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  hintStyle:
                  TextStyle(color: AppColors.primarySecondaryElementText),
                ),
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.normal,
                    fontSize: 14.sp),
                autocorrect: false,
                obscureText: false,
              ),
            )
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          width: 32.w,
          height: 32.h,
          margin: EdgeInsets.only(left: 5.w),
          decoration: BoxDecoration(
            color: AppColors.darkColor,
            borderRadius: BorderRadius.all(Radius.circular(13.w)),
            border: Border.all(color: AppColors.darkColor),
          ),
          child: Image.asset("assets/icons/options.png"),
        ),
      )
    ],
  );
}

//for sliders view
Widget slidersView(BuildContext context, HomePageStates state) {
  CourseItem item = CourseItem();
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            print("my value is");
            print(value.toString());
            context.read<HomePageBlocs>().add(HomePageDots(value));
          },
          children: [
            _slidersContainer(path: "assets/icons/Art.png"),
            _slidersContainer(path: "assets/icons/Image(1).png"),
            _slidersContainer(path: "assets/icons/Image(2).png")
          ],
        ),
      ),
      Container(
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index,
          decorator: DotsDecorator(
              color: AppColors.primaryThreeElementText,
              activeColor: AppColors.primaryElement,
              size: const Size.square(5.0),
              activeSize: const Size(17.0, 5.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0))),
        ),
      )
    ],
  );
}

// sliders widget
Widget _slidersContainer({String path = ""}) {


  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.h)),
        image: DecorationImage(fit: BoxFit.fill, image: AssetImage(path))),
  );
}
//menu view for showing items

Widget menuView() {
  return Column(
    children: [
      Container(
          width: 325.w,
          margin: EdgeInsets.only(top: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              reusableText("Choose your course"),
              GestureDetector(
                onTap: (){toastInfo(msg: "this feature is on developing");},
                  child: reusableText("See all",
                      color: AppColors.primaryColor, fontSize: 14.sp)),

            ],
          )),
      Container(
        margin: EdgeInsets.only(top:20.w),
        child: Row(
          children: [
            _reusableMenuText("All"),
            _reusableMenuText("Popular", textColor: AppColors.primaryThreeElementText, backGroundColor: Colors.white),
            _reusableMenuText("Newest", textColor: AppColors.primaryThreeElementText, backGroundColor: Colors.white),
          ],
        ),
      )
    ],
  );
}



//for the mnue buttons, reusbale text
Widget _reusableMenuText(String menuText, {Color textColor= AppColors.primaryElementText, Color backGroundColor = AppColors.primaryElement}){
  return  Container(
    margin: EdgeInsets.only(right: 20.w),
    decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(7.w),
        border: Border.all(color: backGroundColor)),
    padding: EdgeInsets.only(
        left:15.w, right:15.w, top:5.h, bottom: 5.h
    ),
    child:
    reusableText(menuText,
        color: textColor,
        fontWeight: FontWeight.normal,
        fontSize: 11),
  );
}

// for course grid view ui
Widget courseGrid(CourseItem item){
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        color: Colors.white.withOpacity(0.5),
        
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            height: 60.h,
            child: Image.network(item.image!, fit: BoxFit.cover,),
          ),
        ),
        //course name
        Container(
          child: Text(
            item.name??"",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            softWrap: false,
            style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 11.sp
            ),
          ),
        ),
        //course description
        Text(
         item.description??"",
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.w500,
              fontSize: 10.sp
          ),
        ),
        //author
        Text(
          item.author_name??"",
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.w300,
              fontSize: 10.sp
          ),
        ),

        //rating
        Text(
          "Rate: ${item.rating.toString()}/5"??"",
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
              color: AppColors.ratingColor,
              fontWeight: FontWeight.bold,
              fontSize: 10.sp
          ),
        ),
        //price
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //sale price
            Text(
              "\$${item.net_price.toString()}" ??"",
              maxLines: 1,
              overflow: TextOverflow.fade,
              textAlign: TextAlign.left,
              softWrap: false,
              style: TextStyle(
                  color: AppColors.dangerColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp
              ),
            ),
          SizedBox(width: 4.w,),
          //net price
          Text(
            "\$${item.price.toString()}" ??"",
            maxLines: 1,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.left,
            softWrap: false,
            style: TextStyle(
                color: AppColors.primaryText,
                fontWeight: FontWeight.w500,
                fontSize: 10.sp,
                decoration: TextDecoration.lineThrough
            ),
          ),


        ],),

      ],
    ),
  );
}
