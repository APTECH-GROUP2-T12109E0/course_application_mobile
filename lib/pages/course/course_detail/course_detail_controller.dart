import 'package:course_application_mobile/common/apis/section_api.dart';
import 'package:course_application_mobile/common/entities/section.dart';
import 'package:course_application_mobile/common/entities/section.dart';
import 'package:course_application_mobile/common/values/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../common/apis/course_api.dart';
import '../../../common/apis/lesson_api.dart';
import '../../../common/entities/course.dart';
import '../../../common/entities/lesson.dart';
import '../../../common/routes/route_name.dart';
import '../../../common/widgets/flutter_toast.dart';
import 'bloc/course_detail_blocs.dart';
import 'bloc/course_detail_events.dart';

class CourseDetailController {
  final BuildContext context;

  CourseDetailController({required this.context});

  void init() async {
    final args = ModalRoute
        .of(context)!
        .settings
        .arguments as Map;
    print("init Course detail ");
    print("id in course detail controller: ${args["id"]}");
    asyncLoadCourseData(args["id"]);
    asyncLoadSectionData(args["id"]);
    // asyncLoadLessonData(args["id"]);
  }

  asyncLoadCourseData(int? id) async {
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;
    try {
      var result = await CourseAPI.courseDetail(params: courseRequestEntity);
      if (result != null) {
        if (context.mounted) {
          print('---------context is ready------');
          context.read<CourseDetailBloc>().add(TriggerCourseDetail(result));
        } else {
          print('-------context is not available-------');
        }
      } else {
        toastInfo(msg: "Something went wrong");
      }
    } catch (e) {
      print(e);
      print("catch Course");
    }
  }

  asyncLoadSectionData(int? id) async {
    SectionRequestEntity sectionReq = SectionRequestEntity();
    sectionReq.courseId = id;
    try {
      var result = await SectionAPI.sectionList(params: sectionReq);
      print(result);

      if (result.sections != null) {
        if (context.mounted) {
          context.read<CourseDetailBloc>().add(
              TriggerSectionList(result.sections!));
        } else {
          print('----context is not read ----');
        }
      } else {
        toastInfo(msg: AppMessage.MESSAGE_GENERAL_FAILED);
      }
    } catch (e) {
      print(e);
      print("catch section");
    }
  }

// }
  // asyncLoadLessonData(int? id) async {
  //   LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
  //   lessonRequestEntity.id = id;
  //   var result = await LessonAPI.lessonList(params:lessonRequestEntity);
  //   if(result.code==200){
  //     if(context.mounted){
  //       context.read<CourseDetailBloc>().add(TriggerLessonList(result.data!));
  //       print('my lesson data is ${result.data![2].thumbnail}');
  //     }else{
  //       print('----context is not read ----');
  //     }
  //   }else{
  //     toastInfo(msg: "Something went wrong check the log");
  //   }
  // }


  // Future<void> goBuy(int? id) async {
  //   print("buy course id ${id}");
  //   print("object");
  //   EasyLoading.show(
  //       indicator: CircularProgressIndicator(),
  //       maskType: EasyLoadingMaskType.clear,
  //       dismissOnTap: true
  //   );
  //   CourseRequestEntity courseRequestEntity = CourseRequestEntity();
  //   courseRequestEntity.id = id;
  //   var result = await CourseAPI.coursePay(params: courseRequestEntity);
  //   print("object");
  //   EasyLoading.dismiss();
  //   if (result!= null) {
  //     //cleaner format of url
  //     var url = Uri.decodeFull(result.data!);
  //     // await Navigator.of(context).pushNamed(AppRoutes.PAY_WEB_VIEW, arguments: {"url":url});
  //     var res = await Navigator.of(context).pushNamed(
  //         AppRoutes.PAY_WEB_VIEW, arguments: {
  //       "url": url
  //     });
  //     print("payment $res");
  //     if (res == "success") {
  //       toastInfo(msg: "You bought it successfully");
  //     }
  //     // print('----my returned stripe url is $url--------');
  //   } else {
  //     toastInfo(msg: result.msg!);
  //   }
  // }
}