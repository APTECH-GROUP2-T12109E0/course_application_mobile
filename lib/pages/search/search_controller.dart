import 'package:course_application_mobile/common/apis/course_api.dart';
import 'package:course_application_mobile/common/widgets/flutter_toast.dart';
import 'package:course_application_mobile/pages/search/bloc/search_blocs.dart';
import 'package:course_application_mobile/pages/search/bloc/search_events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MySearchController{
  late BuildContext context;
  MySearchController({required this.context});
  void init(){
    print("search init");
    asyncLoadSearchData();
  }
  Future<void> asyncLoadSearchData() async{
    var result = await CourseAPI.courseList();
    if(result!=null){
      context.read<SearchBlocs>().add(TriggerSearchEvents(result.data!));
    }else{
      toastInfo(msg: "Internet Issue");
    }
  }
}