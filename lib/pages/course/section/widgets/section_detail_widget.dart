import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/entities/section.dart';
import '../../../../common/routes/route_name.dart';
import '../../../../common/values/colors.dart';
import '../../../../common/values/constants.dart';
import '../../../../common/widgets/base_text_widgets.dart';
import '../bloc/section_states.dart';

Widget sectionLessonList(SectionDetailStates state) {
  SectionItem sectionItem;
  return SingleChildScrollView(
    child: ListView.builder(
        shrinkWrap: true,
        itemCount: state.lessonList.length ?? 5,
        itemBuilder: (context, index) {
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
                // Cần coi lại
                Navigator.of(context).pushNamed(AppRoutes.LEARNING_DETAIL,
                    arguments: {
                      "sectionId": state.lessonList.elementAt(index).id
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
                            image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                // image: NetworkImage(state.lessonItem[index].thumbnail!))),
                                image: AssetImage(
                                    "assets/logo/logo_click_thumb_light.png"))),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //list item title
                          // _listContainer("${state}"),
                          //list item description
                          _listContainer("${state.lessonList[index].name ?? "Lesson name"}",
                              color: AppColors.primaryColor),
                          _listContainer(
                            "${state.lessonList[index].description.toString() ?? "Description"}",
                            fontSize: 10,
                            color: AppColors.primarySecondaryElementText,
                            fontWeight: FontWeight.w500,
                          ),
                          _subListContainer(
                            "Duration: ${state.lessonList[index].duration.toString() ?? "0"} minues",
                            fontSize: 10,
                            color: AppColors.primarySecondaryElementText,
                            fontWeight: FontWeight.w500,
                          ),

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

Widget _listContainer(String name,
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
      maxLines: 2,
      style: TextStyle(
          color: color, fontSize: fontSize.sp, fontWeight: FontWeight.bold),
    ),
  );
}

Widget _subListContainer(String name,
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
      maxLines: 2,
      style: TextStyle(
          color: color, fontSize: fontSize.sp, fontWeight: fontWeight),
    ),
  );
}
