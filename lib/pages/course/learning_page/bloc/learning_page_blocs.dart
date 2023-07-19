import 'package:flutter_bloc/flutter_bloc.dart';

import 'learning_page_events.dart';
import 'learning_page_states.dart';

class LearningBlocs extends Bloc<LearningEvents, LearningStates>{
  LearningBlocs():super(const LearningStates()){
    on<TriggerLessonVideo>(_triggerLessonVideo);
    on<TriggerUrlItem>(_triggerUrlItem);
    on<TriggerPlay>(_triggerPlay);
    on<TriggerVideoIndex>(_triggerVideoIndex);
  }
  void _triggerLessonVideo(TriggerLessonVideo event, Emitter<LearningStates>emit){
    emit(state.copyWith(lessonVideoItem: event.lessonVideoItem));
  }
  void _triggerUrlItem(TriggerUrlItem event, Emitter<LearningStates>emit){
    emit(state.copyWith(initializeVideoPlayerFuture: event.initVideoPlayerFuture));
  }
  void _triggerPlay(TriggerPlay event, Emitter<LearningStates>emit){
    emit(state.copyWith(isPlay: event.isPlay));
  }
  void _triggerVideoIndex(TriggerVideoIndex event, Emitter<LearningStates>emit){
    emit(state.copyWith(videoIndex: event.videoIndex));
  }
}