import 'package:course_application_mobile/common/apis/section_api.dart';
import 'package:course_application_mobile/common/entities/section.dart';
import 'package:course_application_mobile/common/entities/section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../../../common/apis/lesson_api.dart';
import '../../../common/entities/lesson.dart';
import 'bloc/learning_page_blocs.dart';
import 'bloc/learning_page_events.dart';

class LearningController {
  final BuildContext context;
  VideoPlayerController? videoPlayerController;

  LearningController({required this.context});

  void init() async{
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    //set the earlier video to false means, stop playing
    context.read<LearningBlocs>().add(TriggerPlay(false));
    await asyncLoadSectionData(args["id"]);
    // await asyncLoadLearningData(args['id']);
    // await asyncLoadLearningData(args['id']);

  }

  Future<void> asyncLoadSectionData(int? id) async {
    SectionRequestEntity sectionReq = SectionRequestEntity();
    sectionReq.sectionId = id;
    var result = await SectionAPI.lessonList(params: sectionReq);
    print("ok result");
    if(result != null) {

    }



    // if(result.code==200){
    //   if(context.mounted){
    //     context.read<LearningBlocs>().add(TriggerLearningVideo(result.data!));
    //     if(result.data!.isNotEmpty){
    //       var url = result.data!.elementAt(0).url;
    //       print('my url is ${url}');
    //       //this url is important for init video player
    //       videoPlayerController = VideoPlayerController.network(url!);
    //       //here actually stream starts to happen
    //       var initPlayer = videoPlayerController?.initialize();
    //       context.read<LearningBlocs>().add(TriggerUrlItem(initPlayer));
    //     }
    //   }
    // }


  }


  void playVideo(String url){
    if(videoPlayerController!=null){
      videoPlayerController?.pause();
      videoPlayerController?.dispose();
    }
    videoPlayerController = VideoPlayerController.network(url);
    context.read<LearningBlocs>().add(const TriggerPlay(false));
    context.read<LearningBlocs>().add(const TriggerUrlItem(null));
    var initPlayer =
        videoPlayerController?.initialize().then((_){
          videoPlayerController?.seekTo(const Duration(milliseconds: 0));
        });
    context.read<LearningBlocs>().add(TriggerUrlItem(initPlayer));
    context.read<LearningBlocs>().add(const TriggerPlay(true));
    videoPlayerController?.play();
  }

}