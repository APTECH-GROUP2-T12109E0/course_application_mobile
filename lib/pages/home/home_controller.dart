import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/apis/course_api.dart';
import '../../common/entities/user.dart';
import '../../global.dart';
import 'bloc/home_page_blocs.dart';
import 'bloc/home_page_events.dart';

class HomeController {
  late BuildContext context;

  UserProfile get userProfile => Global.storageService.getUserProfile();


  static final HomeController _singleton = HomeController._external();

  HomeController._external();

  //this is a factory constructor
  //makes sure you have the the original only one instance
  factory HomeController({required BuildContext context}) {
    _singleton.context = context;
    return _singleton;
  }

  Future<void> init() async {
    if (Global.storageService.getUserToken().isNotEmpty) {
      var result = await CourseAPI.courseList();
      print("ok zo trc result call API");
      if (result.data != null) {
        if (context.mounted) {
          context.read<HomePageBlocs>().add(HomePageCourseItem(result.data!));
          print("Add course to HomePageCourseItem Success");
          return;
        }
      } else {
        print("Null Course Item");
        return;
      }
    } else {
      print("User has already logged out");
    }
    return;
  }
}
