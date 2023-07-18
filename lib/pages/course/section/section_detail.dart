import 'package:course_application_mobile/common/widgets/base_text_widgets.dart';
import 'package:course_application_mobile/pages/course/section/bloc/section_blocs.dart';
import 'package:course_application_mobile/pages/course/section/bloc/section_states.dart';
import 'package:course_application_mobile/pages/course/section/section_controller.dart';
import 'package:course_application_mobile/pages/course/section/widgets/section_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionDetail extends StatefulWidget {
  const SectionDetail({Key? key}) : super(key: key);

  @override
  State<SectionDetail> createState() => _SectionDetailState();
}

class _SectionDetailState extends State<SectionDetail> {
  late SectionDetailController _sectionDetailController;
  late var courseId;
  late var sectionId;

  @override
  void initState(){
    super.initState();

  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    //test
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    courseId = args["courseId"];
    sectionId = args["sectionId"];
    print("course detail ${courseId}");
    Future.delayed(Duration(seconds: 0), (){
      _sectionDetailController = SectionDetailController(context: context);
      _sectionDetailController.init();
    });
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionDetailBloc, SectionDetailStates>(builder: (context, state) {
      print("ok vo section");

      return state.lessonList==null?const Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.blue,
        ),
      ): SafeArea(
        child: Scaffold(
          appBar: buildAppBar("Section Detail"),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sectionLessonList(state),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },);
  }
}
