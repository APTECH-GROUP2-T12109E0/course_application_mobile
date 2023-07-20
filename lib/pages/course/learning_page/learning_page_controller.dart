import 'package:course_application_mobile/common/apis/section_api.dart';
import 'package:course_application_mobile/common/entities/entities.dart';
import 'package:course_application_mobile/common/entities/section.dart';
import 'package:course_application_mobile/common/entities/section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../../../common/apis/lesson_api.dart';
import '../../../common/entities/course.dart';
import '../../../common/entities/lesson.dart';
import '../../../global.dart';
import 'bloc/learning_page_blocs.dart';
import 'bloc/learning_page_events.dart';

class LearningController {
  final BuildContext context;
  late int? lessonId;
  String? accessToken;
  VideoPlayerController? videoPlayerController;
  LearningController({required this.context});


  void init() async {

    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    lessonId = args["lessonId"];
    print("lessonId in learning page controller: ${args["lessonId"]}");

    //set the earlier video to false means, stop playing
    context.read<LearningBlocs>().add(TriggerPlay(false));

    await asyncLoadTrackingDetail(args['lessonId']);

  }

  Future<void> asyncLoadTrackingDetail(int? id) async {
    LessonRequestEntity lessonReq = LessonRequestEntity();
    lessonReq.lessonId = lessonId;
    //mới thêm, bị null
    UserProfile userProfile = Global.storageService.getUserProfile();
    userProfile.access_token = accessToken;
    var result = await LessonAPI.getTrackByLessonId(params: lessonReq);
    print("ok result");
    if (result != null) {
      context.read<LearningBlocs>().add(TriggerLessonVideo(result));
      if (result.url != null) {
        print("ok z");
        var url = "${result.url}?token=$accessToken";
        print('my url is ${url}');
        //this url is important for init video player
        videoPlayerController = VideoPlayerController.network(url!);
        //here actually stream starts to happen
        var initPlayer = videoPlayerController?.initialize();
        context.read<LearningBlocs>().add(TriggerUrlItem(initPlayer));
      }
    }

  }

  void playVideo(String url) {
    if (videoPlayerController != null) {
      videoPlayerController?.pause();
      videoPlayerController?.dispose();
    }
    videoPlayerController = VideoPlayerController.network(url);
    context.read<LearningBlocs>().add(const TriggerPlay(false));
    context.read<LearningBlocs>().add(const TriggerUrlItem(null));
    var initPlayer = videoPlayerController?.initialize().then((_) {
      videoPlayerController?.seekTo(const Duration(milliseconds: 0));
    });
    context.read<LearningBlocs>().add(TriggerUrlItem(initPlayer));
    context.read<LearningBlocs>().add(const TriggerPlay(true));
    videoPlayerController?.play();
  }
}
