import 'package:course_application_mobile/pages/search/bloc/search_events.dart';
import 'package:course_application_mobile/pages/search/bloc/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBlocs extends Bloc<SearchEvents,SearchStates>{
  SearchBlocs():super(SearchStates()){
    on<TriggerSearchEvents>(_triggerSearchEvents);
  }
  _triggerSearchEvents(TriggerSearchEvents event, Emitter<SearchStates> emit){
    emit(state.copyWith(courseItem:event.courseItem));
  }
}