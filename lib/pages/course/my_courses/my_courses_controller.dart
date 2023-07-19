import 'package:course_application_mobile/common/apis/course_api.dart';
import 'package:course_application_mobile/common/entities/entities.dart';
import 'package:course_application_mobile/common/entities/entities.dart';
import 'package:course_application_mobile/global.dart';
import 'package:course_application_mobile/pages/course/my_courses/bloc/my_courses_blocs.dart';
import 'package:course_application_mobile/pages/course/my_courses/bloc/my_courses_events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/entities/course.dart';

class MyCoursesController{
  late BuildContext context;
  MyCoursesController({required this.context});
  UserProfile userProfile = Global.storageService.getUserProfile();
  //sau khi context đc khởi tạo thì sẽ đc call
  void init(){
  //dùng cho các event

    asyncLoadCourseData();
  }
  asyncLoadCourseData() async {
    context.read<MyCourseBlocs>().add(const TriggerLoadingMyCoursesEvents());
    // Future.delayed(Duration(seconds: 1), (){
    //   context.read<MyCourseBlocs>().add(const TriggerLoadingMyCoursesEvents());
    //   print("loading done");
    // });
    UserIdRequestEntity userIdRequestEntity = UserIdRequestEntity();
    userIdRequestEntity.userId = userProfile.id;
    print("ok id");

    var result = await CourseAPI.myCourseList(params: userIdRequestEntity);
    var getData = result.data;
    print("call my course list ok");
    if (result != null){
      if(context.mounted){

        // print("${DateTime.now().toString()}");
        context.read<MyCourseBlocs>().add(const TriggerDoneLoadingMyCoursesEvents());
        //save data to shared storage
        context.read<MyCourseBlocs>().add(TriggerLoadedMyCoursesEvents(result.data!));
        print("result");
        // Future.delayed(Duration(milliseconds: 5), (){
        //   context.read<MyCourseBlocs>().add(const TriggerLoadedMyCoursesEvents([]));
        //   // print("loading done");
        // });
      }

    }
    print("object");
  }

}