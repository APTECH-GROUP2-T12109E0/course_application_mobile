
import 'package:course_application_mobile/common/entities/course.dart';
import 'package:course_application_mobile/common/routes/route_name.dart';
import 'package:course_application_mobile/common/values/colors.dart';
import 'package:course_application_mobile/common/widgets/linear_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/base_text_widgets.dart';
import 'bloc/my_course_detail_blocs.dart';
import 'bloc/my_course_detail_states.dart';
import 'my_course_detail_controller.dart';
import 'widgets/my_course_detail_widgets.dart';

class MyCourseDetail extends StatefulWidget {
  const MyCourseDetail({Key? key}) : super(key: key);

  @override
  State<MyCourseDetail> createState() => _MyCourseDetailState();
}

class _MyCourseDetailState extends State<MyCourseDetail> {
  late MyCourseDetailController _myCourseDetailController;
  late var id;
  // late CourseItem courseItem;
  @override
  void initState(){
    super.initState();

  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    //test
    // id = ModalRoute.of(context)!.settings.arguments as Map;
    // print("course detail ${id.values.toString()}");
    Future.delayed(Duration(seconds: 0), (){
      _myCourseDetailController = MyCourseDetailController(context: context);
      _myCourseDetailController.init();
    });
  }


  @override
  Widget build(BuildContext context) {
    int i=0;
    print("------ my build method -------");
    return BlocBuilder<MyCourseDetailBlocs, MyCourseDetailStates>(
        builder: (context, state){

          return state.courseItem==null?const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
            ),
          ):Container(
            color: Colors.white,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: buildAppBar("My Course detail"),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 25.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //first big image
                            thumbNail(state.courseItem!.image.toString()),
                            SizedBox(height: 15.h,),
                            //three buttons or menus
                            menuView(state.courseItem!.author_name.toString(), state.courseItem!.enrollmentCount!, state.courseItem!.rating!.toDouble()),
                            SizedBox(height: 15.h,),
                            //course description title
                            reusableText(state.courseItem!.name.toString()),
                            SizedBox(height: 15.h,),
                            //course description
                            descriptionText(state.courseItem!.description.toString()),
                            SizedBox(height: 20.h,),
                            //course buy button
                            GestureDetector(
                              onTap: (){
                                // _myCourseDetailController.goBuy(state.courseItem!.id);
                              },
                              child: goBuyButton("Enrolled"),
                            ),

                            SizedBox(height: 20.h,),
                            //course summary title
                            courseSummaryTitle(),

                            //course summary in list
                            courseSummaryView(context,state),
                            SizedBox(height: 20.h,),
                            //Lesson list title
                            reusableText("Section List"),
                            SizedBox(height: 20.h,),
                            //Course lesson list
                            // GestureDetector(
                            //   onTap: (){
                            //     // _myCourseDetailController.goBuy(state.courseItem!.id);
                            //     Navigator.of(context)
                            //         .pushNamedAndRemoveUntil("/lesson_detail", (route) => false);
                            //   },
                            //   child: courseLessonList(state),
                            // ),
                            courseSectionList(context,state),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
            ,
          );
        },

    );
  }
}