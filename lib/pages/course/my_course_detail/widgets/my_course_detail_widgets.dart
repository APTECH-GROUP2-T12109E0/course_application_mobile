import 'package:course_application_mobile/common/entities/course.dart';
import 'package:course_application_mobile/common/entities/lesson.dart';
import 'package:course_application_mobile/common/entities/section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/routes/route_name.dart';
import '../../../../common/values/colors.dart';
import '../../../../common/values/constants.dart';
import '../../../../common/widgets/base_text_widgets.dart';
import '../bloc/my_course_detail_states.dart';

AppBar buildAppBarCourse(){
  return AppBar(
    iconTheme: IconThemeData(color: Colors.black),
    title: reusableText("Course Detail"),
  );
}


// Widget thumbNail(String thumbnail) {

Widget thumbNail(String thumbnail) {
  return Container(
    width: 325.w,
    height: 200.h,
    decoration:  BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: NetworkImage(thumbnail),
          // image: AssetImage("assets/icons/Image(1).png"),
        ),
    ),
  );
}
//
Widget menuView(String author, int enrollment, double rating ) {
  return SizedBox(
    width: 325.w,
    child: Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(7.w),
                  border: Border.all(color: AppColors.primaryColor)),
              child: reusableText(author,
                  color: AppColors.primaryElementText,
                  fontWeight: FontWeight.normal,
                  fontSize: 10.sp)),
        ),
        _iconAndNum("assets/icons/people.png", 0,0),
        _iconAndNum("assets/icons/star.png", 0,0)
      ],
    ),
  );
}
//
Widget _iconAndNum(String iconPath, int enrollment, int rating) {
  return Container(
    margin: EdgeInsets.only(left: 30.w),
    child: Row(
      children: [
        Image(
          image: AssetImage(iconPath),
          width: 20.w,
          height: 20.h,
        ),
        reusableNum(enrollment,
            color: AppColors.primaryThreeElementText,
            fontSize: 11.sp,
            fontWeight: FontWeight.normal),
        reusableNum(rating,
            color: AppColors.primaryThreeElementText,
            fontSize: 11.sp,
            fontWeight: FontWeight.normal),
      ],
    ),
  );
}
//
Widget descriptionText(String description) {
  return reusableText(
      description,
      color: AppColors.primaryThreeElementText,
      fontWeight: FontWeight.normal,
      fontSize: 11.sp);
}
//
Widget goBuyButton(String name) {
  return Container(
    padding: EdgeInsets.only(top: 13.h),
    width: 330.w,
    height: 50.h,
    decoration: BoxDecoration(
        color: AppColors.primaryElement,
        borderRadius: BorderRadius.circular(10.w),
        border: Border.all(color: AppColors.primaryElement)),
    child: Text(
      name,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: AppColors.primaryElementText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal),
    ),
  );
}
//
Widget courseSummaryTitle() {
  return reusableText("The Course Includes", fontSize: 14.sp, );
}
//
//
// Cần Fixed lại
Widget courseSummaryView(BuildContext context, MyCourseDetailStates state) {

//setting sections buttons
  var imagesInfo = <String, String>{
    "${state.courseItem!.duration.toString() ?? "0"} Hours Video": "video_detail.png",
    "Total ${state.courseItem!.sections!.length.toString() ?? "0"} Sections": "file_detail.png",
    "${state.courseItem!.enrollmentCount.toString() ?? "0"} Enrollment": "people.png",
  };
  return Column(
    children: [
      ...List.generate(
        imagesInfo.length,
        (index) => GestureDetector(
          onTap: () => null,
          child: Container(
            margin: EdgeInsets.only(top: 15.h),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  //padding: EdgeInsets.all(7.0.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: Colors.transparent),
                  child: Image.asset(
                    "assets/icons/${imagesInfo.values.elementAt(index)}",
                    width: 30.w,
                    height: 30.h,
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text(imagesInfo.keys.elementAt(index),
                    style: TextStyle(
                        color: AppColors.primarySecondaryElementText,
                        fontWeight: FontWeight.bold,
                        fontSize: 11.sp))
              ],
            ),
          ),
        ),
      )
    ],
  );
}
//
Widget courseSectionList(BuildContext context,MyCourseDetailStates state) {
  SectionItem sectionItem;
  final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
  var courseId = args['id'];

  return SingleChildScrollView(

    child: ListView.builder(
        shrinkWrap: true,
        itemCount: state.courseItem!.sections!.length,
        itemBuilder: (context, index){
      return Container(
        margin: EdgeInsets.only(top: 10.h),
        width: 325.w,
        height: 100.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.circular(10.w),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 1))
            ]),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.MY_SECTION_DETAIL, arguments: {
              "sectionId":state.sectionItem[index].id,
              "courseId": courseId
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //for image and the text
              Row(
                children: [
                  Container(
                    width: 60.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.h),
                        image:  DecorationImage(
                            fit: BoxFit.fitHeight,
                            // image: NetworkImage(state.lessonItem[index].thumbnail!))),
                            image: AssetImage("assets/logo/logo_click_thumb_light.png"))),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      //list item title
                      // _listContainer("Part ${state.sectionItem[index].id.toString()}"),
                      //list item description
                      _listContainer("${state.sectionItem[index].name}", color: AppColors.primaryColor),
                      // Tạm ẩn
                      // _subListContainer(
                      //     "Total lesson: ${state.sectionItem.length.toString()}",
                      //     fontSize: 10,
                      //     color: AppColors.primarySecondaryElementText,
                      //     fontWeight: FontWeight.w500)
                    ],
                  )
                ],
              ),

              //for showing the right arrow
              Container(
                child: Image(
                  height: 24.h,
                  width: 24.h,
                  image: AssetImage("assets/icons/arrow_right.png"),
                ),
              )
            ],
          ),
        ),
      );
    }),
  );
}

Widget _listContainer(
    String name,
    {double fontSize = 13,
    Color color = AppColors.primaryText,
    fontWeight = FontWeight.bold}) {
  return Container(
    width: 200.w,
    height: 30.h,
    margin: EdgeInsets.only(left: 6.w),
    child: Text(
      name,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(
          color: color, fontSize: fontSize.sp, fontWeight: FontWeight.bold),
    ),
  );
}

Widget _subListContainer(
    String name,
    {double fontSize = 10,
      Color color = AppColors.primarySecondaryElementText,
      fontWeight = FontWeight.w500}) {
  return Container(
    width: 120.w,
    height: 20.h,
    margin: EdgeInsets.only(left: 10.w),
    child: Text(
      name,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(
          color: color, fontSize: fontSize.sp, fontWeight: fontWeight),
    ),
  );
}

//course detail
// var imagesInfo =<String, String>{
//   "36 hours Video":"video_detail.png",
//   "Total 30 lessons":"file_detail.png",
//   "67 Download Resources":"cloud-download.png",
// };
//
//
// Widget courseSummaryView(BuildContext context){
//   return Column(
//     children: [
//       ...List.generate(imagesInfo.length, (index) => GestureDetector(
//         onTap: ()=>Navigator.of(context).pushNamed(AppRoutes.LESSON_DETAIL),
//
//         child: Container(
//           margin: EdgeInsets.only(bottom: 15.h),
//           child: Row(
//             children: [
//               Container(
//                 width: 30.w,
//                 height: 30.h,
//                 padding: EdgeInsets.all(7.0.w),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10.w),
//                     color: AppColors.primaryElement),
//                 child: Image.asset("assets/icons/${imagesInfo.values.elementAt(index)}"),
//               ),
//               SizedBox(
//                 width: 15.w,
//               ),
//               Text(imagesInfo.keys.elementAt(index),
//                   style: TextStyle(
//                       color: AppColors.primarySecondaryElementText,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 12.sp))
//             ],
//           ),
//         ),
//       ),)
//
//     ],
//   );
// }

// Widget courseLessonList(){
//   return Container(
//     width: 325.w,
//     height: 80.h,
//     decoration: BoxDecoration(
//       color: Color.fromARGB(255, 255, 255, 1),
//       borderRadius: BorderRadius.circular(10.w),
//       boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1),),],
//     ),
//   );
// }
