import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_course_detail_events.dart';
import 'my_course_detail_states.dart';

class MyCourseDetailBlocs extends Bloc<MyCourseDetailEvents, MyCourseDetailStates>{
  MyCourseDetailBlocs():super(const MyCourseDetailStates()){
    on<TriggerMyCourseDetail>(_triggerMyCourseDetail);
    on<TriggerMySectionList>(_triggerMySectionList);
    on<TriggerMyLessonList>(_triggerMyLessonList);
  }
  void _triggerMyCourseDetail(TriggerMyCourseDetail event, Emitter<MyCourseDetailStates>emit){
    emit(state.copyWith(courseItem: event.courseItem));
  }

  void _triggerMySectionList(TriggerMySectionList event, Emitter<MyCourseDetailStates>emit){
    emit(state.copyWith(sectionItem:event.sectionItem));
  }

  void _triggerMyLessonList(TriggerMyLessonList event, Emitter<MyCourseDetailStates>emit){
    emit(state.copyWith(lessonItem:event.lessonItem));
  }
}