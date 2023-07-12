import 'package:course_application_mobile/pages/home/bloc/home_page_blocs.dart';
import 'package:course_application_mobile/pages/home/bloc/home_page_states.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/entities/course.dart';
import '../../../common/values/colors.dart';
import '../../../common/values/constants.dart';
import '../../../common/widgets/base_text_widgets.dart';
import '../bloc/home_page_events.dart';

AppBar buildAppBar(String avatar) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Container(
      margin: EdgeInsets.only(left: 15.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          GestureDetector(
            child: Container(
              width: 32.w,
              height: 32.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  // image: NetworkImage("${AppConstants.SERVER_API_URL}$avatar"),
                  image: AssetImage("assets/icons/person.png"),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

//reusable big text widget
Widget homePageText(String text,
    {Color color = AppColors.primaryElementText, int top = 20}) {
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
        width: 260.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: AppColors.primaryBackground,
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
              width: 220.w,
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
          margin: EdgeInsets.only(left: 5.w),
          width: 32.w,
          height: 32.h,
          decoration: BoxDecoration(
            color: AppColors.darkColor,
            borderRadius: BorderRadius.all(Radius.circular(8.w)),
            border: Border.all(color: Colors.transparent),
          ),
          child: Image.asset("assets/icons/options.png"),
        ),
      )
    ],
  );
}

//for sliders view
Widget slidersView(BuildContext context, HomePageStates state) {
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
          // position: state.index.toDouble(),
          position: state.index.toInt(),
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
Widget _slidersContainer({String path = "assets/icons/Art.png"}) {
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
                  child: reusableText("See all",
                      color: AppColors.primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
            ],
          )),
      Container(
        margin: EdgeInsets.only(top: 20.w),
        child: Row(
          children: [
            _reusableMenuText("All"),
            _reusableMenuText("Popular",
                textColor: AppColors.primaryThreeElementText,
                backGroundColor: Colors.white),
            _reusableMenuText("Newest",
                textColor: AppColors.primaryThreeElementText,
                backGroundColor: Colors.white),
          ],
        ),
      )
    ],
  );
}

//for the mnue buttons, reusbale text
Widget _reusableMenuText(String menuText,
    {Color textColor = AppColors.primaryElementText,
    Color backGroundColor = AppColors.primaryElement}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(7.w),
        border: Border.all(color: backGroundColor)),
    padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
    child: reusableText(
      menuText,
      color: textColor,
      fontWeight: FontWeight.normal,
      fontSize: 11,
    ),
  );
}

// for course grid view ui
// Widget courseGrid(CourseItem item) {
// // Widget courseGrid() {
//   return Container(
//     padding: EdgeInsets.all(12.w),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(15.w),
//       image: DecorationImage(
//         fit: BoxFit.fill,
//         // image: NetworkImage(AppConstants.SERVER_UPLOADS + item.thumbnail!),
//         image: AssetImage("assets/icons/image_1.png"),
//       ),
//     ),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           item.name ?? "",
//           maxLines: 1,
//           overflow: TextOverflow.fade,
//           textAlign: TextAlign.left,
//           softWrap: false,
//           style: TextStyle(
//               color: AppColors.primaryElementText,
//               fontWeight: FontWeight.bold,
//               fontSize: 11.sp),
//         ),
//         SizedBox(
//           height: 5.h,
//         ),
//         Text(
//           item.description ?? "",
//           maxLines: 1,
//           overflow: TextOverflow.fade,
//           textAlign: TextAlign.left,
//           softWrap: false,
//           style: TextStyle(
//               color: AppColors.primaryFourElementText,
//               fontWeight: FontWeight.normal,
//               fontSize: 8.sp),
//         )
//       ],
//     ),
//   );
// }
Widget courseGrid() {
  return Container(
    padding: EdgeInsets.all(5.w),
    // color: Colors.grey,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
            "assets/icons/Image(1).png" ),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Best course fo IT",
          style: TextStyle(
            color: AppColors.primaryElementText,
            fontSize: 11.sp,
          ),
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          "Best course fo IT",
          style: TextStyle(
            color: AppColors.darkColor,
            fontSize: 9.sp,
          ),
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
        ),
      ],
    ),
  );
}
