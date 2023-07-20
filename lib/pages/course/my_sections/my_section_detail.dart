import 'package:course_application_mobile/common/widgets/base_text_widgets.dart';
import 'package:course_application_mobile/pages/course/my_sections/bloc/my_section_blocs.dart';
import 'package:course_application_mobile/pages/course/my_sections/bloc/my_section_states.dart';
import 'package:course_application_mobile/pages/course/my_sections/my_section_controller.dart';
import 'package:course_application_mobile/pages/course/my_sections/widgets/my_section_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MySectionDetail extends StatefulWidget {
  const MySectionDetail({Key? key}) : super(key: key);

  @override
  State<MySectionDetail> createState() => _MySectionDetailState();
}

class _MySectionDetailState extends State<MySectionDetail> {
  late MySectionDetailController _mySectionDetailController;
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
      _mySectionDetailController = MySectionDetailController(context: context);
      _mySectionDetailController.init();
    });
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MySectionDetailBloc, MySectionDetailStates>(builder: (context, state) {
      print("ok vo my section");

      return state.lessonList==null?const Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.blue,
        ),
      ): SafeArea(
        child: Scaffold(
          appBar: buildAppBar("My Section Detail"),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      mySectionLessonList(state),
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
