
import 'package:course_application_mobile/common/entities/course.dart';
import 'package:course_application_mobile/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/base_text_widgets.dart';
import 'bloc/course_detail_blocs.dart';
import 'bloc/course_detail_states.dart';
import 'course_detail_controller.dart';
import 'widgets/course_detail_widgets.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({Key? key}) : super(key: key);

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  late CourseDetailController _courseDetailController;
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
      _courseDetailController = CourseDetailController(context: context);
      _courseDetailController.init();
    });

  }

  // @override
  // Widget build(BuildContext context){
  //   // CourseItem item = courseItem;
  //   return Container(
  //     color: Colors.blueAccent,
  //     child: SafeArea(
  //       child: Scaffold(
  //         appBar: buildAppBarCourse(),
  //         // body: Center(
  //         //   child: Text(" course id: ${id.values.toString()} ok \n processing... \n press ESC to back to home"),
  //         // ),
  //         body: SingleChildScrollView(
  //           child:  Column(
  //             children: [
  //                 Padding(
  //                   padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
  //                   child: Column(
  //                     children: [
  //                       thumbNail(),
  //                       SizedBox(height: 5.h,),
  //                       menuView(),
  //                       SizedBox(height: 5.h,),
  //                       reusableText("Course Description"),
  //                      descriptionText("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"),
  //                       SizedBox(height: 5.h,),
  //                       goBuyButton("Buy This Course"),
  //                       SizedBox(height: 5.h,),
  //                       courseSummaryTitle(),
  //                       SizedBox(height: 5.h,),
  //                       courseSummaryView(context),
  //                       SizedBox(height: 5.h,),
  //                       reusableText("Lesson List"),
  //                       courseLessonList(state.toString()),
  //                     ],
  //                   ),
  //                 ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     )
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    int i=0;
    print("------ my build method -------");
    return BlocBuilder<CourseDetailBloc, CourseDetailStates>(
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
                appBar: buildAppBar("Course detail"),
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
                                // _courseDetailController.goBuy(state.courseItem!.id);
                              },
                              child: goBuyButton("Buy This Course"),
                            ),

                            SizedBox(height: 20.h,),
                            //course summary title
                            courseSummaryTitle(),

                            //course summary in list
                            courseSummaryView(context,state),
                            SizedBox(height: 20.h,),
                            //Lesson list title
                            reusableText("Lesson List"),
                            SizedBox(height: 20.h,),
                            //Course lesson list
                            courseLessonList(state)
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