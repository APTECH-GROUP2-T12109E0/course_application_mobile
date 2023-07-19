import 'package:course_application_mobile/pages/course/my_courses/bloc/my_courses_events.dart';
import 'package:course_application_mobile/pages/course/my_courses/bloc/my_courses_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCourseBlocs extends Bloc<MyCoursesEvents,MyCoursesStates>{
  // MyCourseBlocs():super(LoadedMyCoursesStates([])){
  MyCourseBlocs():super(const InitialMyCoursesStates()){
    on<TriggerInitialMyCoursesEvents>(_triggerInitialMyCoursesEvents);
  on<TriggerLoadedMyCoursesEvents>(_triggerLoadedMyCourses);
  on<TriggerLoadingMyCoursesEvents>(_triggerLoadingMyCourses);
  on<TriggerDoneLoadingMyCoursesEvents>(_triggerDoneLoadingMyCourses);
  }

  _triggerInitialMyCoursesEvents(TriggerInitialMyCoursesEvents event,Emitter<MyCoursesStates> emit){
    print("initial........");
    emit(InitialMyCoursesStates());
  }

  _triggerLoadedMyCourses(TriggerLoadedMyCoursesEvents event,Emitter<MyCoursesStates> emit){
    print("loaded........");
    emit(LoadedMyCoursesStates(event.courseItem));
  }
  _triggerLoadingMyCourses(TriggerLoadingMyCoursesEvents event,Emitter<MyCoursesStates> emit){
    print("....loading........");
    //call state trực tiếp
  emit(const LoadingMyCoursesStates());
  }

  _triggerDoneLoadingMyCourses(TriggerDoneLoadingMyCoursesEvents event,Emitter<MyCoursesStates> emit){
    print("done........");
    //call state trực tiếp
    emit(const DoneLoadingMyCoursesStates());
  }
}