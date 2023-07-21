import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/entities/user.dart';
import '../../../common/widgets/base_text_widgets.dart';
import '../../../global.dart';
import 'bloc/learning_page_blocs.dart';
import 'bloc/learning_page_events.dart';
import 'bloc/learning_page_states.dart';
import 'learning_page_controller.dart';
import 'widgets/learning_page_detail_widgets.dart';

//tạm ẩn
class LearningPage extends StatefulWidget {
  const LearningPage({Key? key}) : super(key: key);

  @override
  State<LearningPage> createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  late LearningController _lessonController;
  int videoIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _lessonController = LearningController(context: context);
    context.read<LearningBlocs>().add(const TriggerUrlItem(null));
    context.read<LearningBlocs>().add(const TriggerVideoIndex(0));
    _lessonController.init();
    super.didChangeDependencies();
    var userProfile = Global.storageService.getUserProfile();
    print("token is ${jsonEncode(userProfile.access_token)}");
  }
  UserProfile get userProfile => Global.storageService.getUserProfile();
  @override
  void dispose() {
    _lessonController.videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LearningBlocs, LearningStates>(
        builder: (context, state) {
      print('my future is ${state.initializeVideoPlayerFuture}');
      return state.lessonVideoItem == null
          ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
              ),
            )
          : SafeArea(
              child: Container(
                  color: Colors.white,
                  child: Scaffold(
                      backgroundColor: Colors.white,
                      appBar: buildAppBar("Learning"),
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
                                  videoControls(
                                      state, _lessonController, context)
                                ],
                              ),
                            ),
                          ),
                          // videoList(state, _lessonController),

                        ],
                      ))),
            );
    });
  }
}

// class LearningPage extends StatefulWidget {
//   const LearningPage({Key? key}) : super(key: key);
//
//   @override
//   State<LearningPage> createState() => _LearningPageState();
// }
//
// class _LearningPageState extends State<LearningPage> {
//     late LearningController _learningController;
//   int videoIndex = 0;
//     @override
//   void didChangeDependencies() {
//       _learningController = LearningController(context: context);
//     context.read<LearningBlocs>().add(const TriggerUrlItem(null));
//     context.read<LearningBlocs>().add(const TriggerVideoIndex(0));
//       _learningController.init();
//     super.didChangeDependencies();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(child: Text("video"),),
//     );
//   }
// }
