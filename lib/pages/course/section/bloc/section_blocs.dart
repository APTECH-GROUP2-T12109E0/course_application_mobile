import 'package:course_application_mobile/pages/course/section/bloc/section_events.dart';
import 'package:course_application_mobile/pages/course/section/bloc/section_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SectionDetailBloc extends Bloc<SectionDetailEvents, SectionDetailStates>{
  // SectionDetailBloc():super(const SectionDetailStates()){
  //   on<TriggerSectionDetail>(_triggerSectionDetail);
  //   on<TriggerSectionList>(_triggerSectionList);
  //   on<TriggerLessonList>(_triggerLessonList);
  // }
  // void _triggerSectionDetail(TriggerSectionDetail event, Emitter<SectionDetailStates>emit){
  //   emit(state.copyWith(sectionDetail: event.sectionDetail));
  // }
  // //
  // void _triggerSectionList(TriggerSectionList event, Emitter<SectionDetailStates>emit){
  //   emit(state.copyWith(sectionItem:event.sectionItem));
  // }
  //
  // void _triggerLessonList(TriggerLessonList event, Emitter<SectionDetailStates>emit){
  //   emit(state.copyWith(lessonItem:event.lessonItem));
  // }

  SectionDetailBloc():super(const SectionDetailStates()){
    on<TriggerSectionItem>(_triggerSectionItem);
    on<TriggerSectionList>(_triggerSectionList);
    on<TriggerLessonList>(_triggerLessonList);
  }
  void _triggerSectionItem(TriggerSectionItem event, Emitter<SectionDetailStates>emit){
    emit(state.copyWith(sectionItem: event.sectionItem));
  }
  //
  void _triggerSectionList(TriggerSectionList event, Emitter<SectionDetailStates>emit){
    emit(state.copyWith(sectionList:event.sectionList));
  }

  void _triggerLessonList(TriggerLessonList event, Emitter<SectionDetailStates>emit){
    emit(state.copyWith(lessonList:event.lessonList));
  }
}