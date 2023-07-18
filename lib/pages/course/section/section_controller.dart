import 'package:course_application_mobile/common/apis/lesson_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/apis/section_api.dart';
import '../../../common/entities/lesson.dart';
import '../../../common/entities/section.dart';
import '../../../common/values/message.dart';
import '../../../common/widgets/flutter_toast.dart';
import 'bloc/section_blocs.dart';
import 'bloc/section_events.dart';

class SectionDetailController {
  final BuildContext context;

  SectionDetailController({required this.context});

  void init() async {
    final args = ModalRoute
        .of(context)!
        .settings
        .arguments as Map<String, dynamic>;
    print("courseId in section controller: ${args["courseId"]}");
    print("sectionId in section controller: ${args["sectionId"]}");
    asyncLoadSectionByCourseId(args["courseId"]);
    asyncLoadLessonData(args["sectionId"]);
    // asyncLoadLessonData(args["id"]);
  }

  asyncLoadSectionByCourseId(int? sectionId) async {
    SectionRequestEntity sectionReq = SectionRequestEntity();
    sectionReq.sectionId = sectionId;
    var result = await SectionAPI.getSectionByCourseId(params: sectionReq);
    print("ok result sectiondata");
    if (result != null) {
      if (context.mounted) {
        context.read<SectionDetailBloc>().add(
            TriggerSectionList(result! as List<SectionItem>));
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
  //       context.read<SectionDetailBloc>().add(
  //           TriggerSectionList(result.sections!));
  //     } else {
  //       print('----context is not read ----');
  //     }
  //   }else {
  //     toastInfo(msg: AppMessage.MESSAGE_GENERAL_FAILED);
  //   }
  // }

  asyncLoadLessonData(int? sectionId) async {
    LessonRequestEntity lessonReq = LessonRequestEntity();
    lessonReq.id = sectionId;
    print("before lesson list");
    var result = await LessonAPI.lessonList(params: lessonReq);
    print("ok result lesson list");
    if (result.lessons != null) {
      if (context.mounted) {
        context.read<SectionDetailBloc>().add(
            TriggerLessonList(result.lessons!));
      } else {
        print('----context is not read ----');
      }
    }else {
      toastInfo(msg: AppMessage.MESSAGE_GENERAL_FAILED);
    }
  }
}
