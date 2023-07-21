
import 'package:course_application_mobile/pages/course/learning_page/bloc/learning_page_states.dart';
import 'package:equatable/equatable.dart';

import '../../../../common/entities/lesson.dart';

abstract class LearningEvents{
  const LearningEvents();
  @override
  List<Object?> get props => [];
}

class TriggerLessonVideo extends LearningEvents{
  const TriggerLessonVideo(this.lessonVideoItem);
  // final List<LessonVideoItem> lessonVideoItem;
  final LessonVideoItem lessonVideoItem;

  @override
  List<Object?> get props => [lessonVideoItem];
}

class TriggerUrlItem extends LearningEvents{
  final Future<void>? initVideoPlayerFuture;
  const TriggerUrlItem(this.initVideoPlayerFuture);
  @override
  List<Object?> get props => [initVideoPlayerFuture];
}

class TriggerPlay extends LearningEvents{
  final bool isPlay;
  const TriggerPlay(this.isPlay);
  @override
  List<Object?> get props => [isPlay];
}
class TriggerVideoIndex extends LearningEvents{
  final int videoIndex;
  const TriggerVideoIndex(this.videoIndex);
  @override
  List<Object?> get props => [videoIndex];
}

//phần thêm
class TriggerLessonList extends LearningEvents{
  const TriggerLessonList(this.lessonList):super();
  final List<LessonItem> lessonList;
}