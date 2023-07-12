import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/base_text_widgets.dart';
import 'bloc/lesson_blocs.dart';
import 'bloc/lesson_events.dart';
import 'bloc/lesson_states.dart';
import 'lesson_controller.dart';
import 'widgets/lesson_detail_widgets.dart';

class LessonDetail extends StatefulWidget {
  const LessonDetail({Key? key}) : super(key: key);

  @override
  State<LessonDetail> createState() => _LessonDetailState();
}

class _LessonDetailState extends State<LessonDetail> {
  late LessonController _lessonController;
  int videoIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _lessonController = LessonController(context: context);
    context.read<LessonBlocs>().add(const TriggerUrlItem(null));
    context.read<LessonBlocs>().add(const TriggerVideoIndex(0));
    _lessonController.init();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _lessonController.videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonBlocs, LessonStates>(builder: (context, state) {
      print('my future is ${state.initializeVideoPlayerFuture}');
      return SafeArea(
        child: Container(
            color: Colors.white,
            child: Scaffold(
                backgroundColor: Colors.white,
                appBar: buildAppBar("Lesson detail"),
                body: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.h, horizontal: 25.w),
                      sliver: SliverToBoxAdapter(
                        child: Column(
                          children: [
                            //video preview
                            videoPlayer(state, _lessonController),
                            //video buttons
                            videoControls(state, _lessonController, context)
                          ],
                        ),
                      ),
                    ),
                    videoList(state, _lessonController),
                  ],
                ))),
      );
    });
  }

}