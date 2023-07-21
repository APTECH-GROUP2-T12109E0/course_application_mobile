import 'package:course_application_mobile/common/apis/lesson_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/apis/section_api.dart';
import '../../../common/entities/lesson.dart';
import '../../../common/entities/section.dart';
import '../../../common/values/message.dart';
import '../../../common/widgets/flutter_toast.dart';
import 'bloc/my_section_blocs.dart';
import 'bloc/my_section_events.dart';

class MySectionDetailController {
  final BuildContext context;

  MySectionDetailController({required this.context});

  void init() async {
    final args = ModalRoute
        .of(context)!
        .settings
        .arguments as Map<String, dynamic>;
    print("courseId in my section controller: ${args["courseId"]}");
    print("sectionId in my section controller: ${args["sectionId"]}");
    asyncLoadMySectionByCourseId(args["courseId"]);
    asyncLoadMyLessonData(args["sectionId"]);
    // asyncLoadMyLessonData(args["id"]);
  }

  asyncLoadMySectionByCourseId(int? sectionId) async {
    SectionRequestEntity sectionReq = SectionRequestEntity();
    sectionReq.sectionId = sectionId;
    var result = await SectionAPI.getSectionByCourseId(params: sectionReq);
    print("ok result getSectionByCourseId in my section controller");
    if (result != null) {
      if (context.mounted) {
        context.read<MySectionDetailBloc>().add(
            TriggerMySectionList(result! as List<SectionItem>));
      } else {
        print('----context is not read ----');
      }
    }else {
      toastInfo(msg: AppMessage.MESSAGE_GENERAL_FAILED);
    }
  }
  // Tạm ẩn
  // asyncLoadSectionData(int? id) async {
  //   SectionRequestEntity sectionReq = SectionRequestEntity();
  //   sectionReq.id = id;
  //   var result = await SectionAPI.sectionList(params: sectionReq);
  //   print("ok result sectiondata");
  //   if (result.sections != null) {
  //     if (context.mounted) {
  //       context.read<MySectionDetailBloc>().add(
  //           TriggerMySectionList(result.sections!));
  //     } else {
  //       print('----context is not read ----');
  //     }
  //   }else {
  //     toastInfo(msg: AppMessage.MESSAGE_GENERAL_FAILED);
  //   }
  // }

  asyncLoadMyLessonData(int? sectionId) async {
    LessonRequestEntity lessonReq = LessonRequestEntity();
    lessonReq.id = sectionId;
    var result = await LessonAPI.lessonList(params: lessonReq);
    print("ok result my lesson list in my section controller");
    if (result.lessons != null) {
      if (context.mounted) {
        print("above TriggerMyLessonList");
        context.read<MySectionDetailBloc>().add(
            TriggerMyLessonList(result.lessons!));
        print("under TriggerMyLessonList");
      } else {
        print('----context is not read ----');
      }
    }else {
      toastInfo(msg: AppMessage.MESSAGE_GENERAL_FAILED);
    }
  }
}
