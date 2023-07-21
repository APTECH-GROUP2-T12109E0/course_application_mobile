import 'package:course_application_mobile/pages/course/my_sections/bloc/my_section_events.dart';
import 'package:course_application_mobile/pages/course/my_sections/bloc/my_section_states.dart';
import 'package:course_application_mobile/pages/course/section/bloc/section_events.dart';
import 'package:course_application_mobile/pages/course/section/bloc/section_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MySectionDetailBloc extends Bloc<MySectionDetailEvents, MySectionDetailStates>{
  // MySectionDetailBloc():super(const MySectionDetailStates()){
  //   on<TriggerSectionDetail>(_triggerSectionDetail);
  //   on<TriggerMySectionList>(_triggerMySectionList);
  //   on<TriggerMyLessonList>(_triggerMyLessonList);
  // }
  // void _triggerSectionDetail(TriggerSectionDetail event, Emitter<MySectionDetailStates>emit){
  //   emit(state.copyWith(sectionDetail: event.sectionDetail));
  // }
  // //
  // void _triggerMySectionList(TriggerMySectionList event, Emitter<MySectionDetailStates>emit){
  //   emit(state.copyWith(sectionItem:event.sectionItem));
  // }
  //
  // void _triggerMyLessonList(TriggerMyLessonList event, Emitter<MySectionDetailStates>emit){
  //   emit(state.copyWith(lessonItem:event.lessonItem));
  // }

  MySectionDetailBloc():super(const MySectionDetailStates()){
    on<TriggerMySectionItem>(_triggerMySectionItem);
    on<TriggerMySectionList>(_triggerMySectionList);
    on<TriggerMyLessonList>(_triggerMyLessonList);
  }
  void _triggerMySectionItem(TriggerMySectionItem event, Emitter<MySectionDetailStates>emit){
    emit(state.copyWith(sectionItem: event.sectionItem));
  }
  //
  void _triggerMySectionList(TriggerMySectionList event, Emitter<MySectionDetailStates>emit){
    emit(state.copyWith(sectionList:event.sectionList));
  }

  void _triggerMyLessonList(TriggerMyLessonList event, Emitter<MySectionDetailStates>emit){
    emit(state.copyWith(lessonList:event.lessonList));
  }
}