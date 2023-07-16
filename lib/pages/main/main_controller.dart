import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/apis/course_api.dart';
import '../../common/entities/user.dart';
import '../../global.dart';
import '../home/bloc/home_page_blocs.dart';
import '../home/bloc/home_page_events.dart';

class MainController{
  late BuildContext context;
  UserProfile get userProfile => Global.storageService.getUserProfile();

  static final MainController _singleton= MainController._external();

  MainController._external();
  //this is a factory constructor
  //makes sure you have the the original only one instance
  factory MainController({required BuildContext context}){
    _singleton.context  = context;
    return _singleton;
  }


  Future<void> init() async {
    if(Global.storageService.getUserToken().isNotEmpty){
      var result = await CourseAPI.courseList();
      if(result.data != null){
        if(context.mounted){
          context.read<HomePageBlocs>().add(HomePageCourseItem(result.data!));
          return;
        }
      }else{
        print(result);
        return;
      }
    }else{
      print("User has already logged out");
    }
    return;
  }
}
