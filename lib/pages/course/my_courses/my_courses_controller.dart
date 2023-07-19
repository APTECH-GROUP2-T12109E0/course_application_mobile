import 'package:course_application_mobile/common/apis/course_api.dart';
import 'package:course_application_mobile/pages/course/my_courses/bloc/my_courses_blocs.dart';
import 'package:course_application_mobile/pages/course/my_courses/bloc/my_courses_events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCoursesController{
  late BuildContext context;
  MyCoursesController({required this.context});
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
    var result = await CourseAPI.courseList();
    if (result != null){
      if(context.mounted){
        //save data to shared storage
        context.read<MyCourseBlocs>().add(const TriggerLoadedMyCoursesEvents([]));
        print("${DateTime.now().toString()}");
        context.read<MyCourseBlocs>().add(const TriggerDoneLoadingMyCoursesEvents());
        // Future.delayed(Duration(milliseconds: 5), (){
        //   context.read<MyCourseBlocs>().add(const TriggerLoadingMyCoursesEvents());
        //   // print("loading done");
        // });
      }

    }
  }

}