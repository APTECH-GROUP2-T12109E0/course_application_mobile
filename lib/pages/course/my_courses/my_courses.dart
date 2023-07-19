import 'package:course_application_mobile/common/widgets/base_text_widgets.dart';
import 'package:course_application_mobile/pages/course/my_courses/bloc/my_courses_blocs.dart';
import 'package:course_application_mobile/pages/course/my_courses/bloc/my_courses_states.dart';
import 'package:course_application_mobile/pages/course/my_courses/my_courses_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCourses extends StatefulWidget {
  const MyCourses({Key? key}) : super(key: key);

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  late MyCoursesController _myCoursesController;
  @override
  void didChangeDependencies(){
    _myCoursesController = MyCoursesController(context: context);
    _myCoursesController.init();
    super.didChangeDependencies();

  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCourseBlocs, MyCoursesStates>(builder: (context, state) {
      if(state is DoneLoadingMyCoursesStates){
        print("done Loading data...");
        return Scaffold(
          appBar: buildAppBar("My Courses"),
          body: Center(
            child: Text("My courses"),
          ),
        );
      } else if(state is LoadedMyCoursesStates){
        print("done Data Loaded...");
        return const Center(child: Text("data"),);
      }
      else if (state is LoadingMyCoursesStates) {
        print("Data Loading...");
        return const Center(child: CircularProgressIndicator(),);
      }
      return const Center(child: Text("ok"),);
    },);

  }
}
