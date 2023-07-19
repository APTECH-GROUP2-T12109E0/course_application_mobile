
import 'package:equatable/equatable.dart';

import '../../../../common/entities/lesson.dart';

class LearningStates extends Equatable{
  final List<LessonVideoItem> lessonVideoItem;
  final Future<void>? initializeVideoPlayerFuture;
  final bool isPlay;
  final int videoIndex;

  const LearningStates(
      {this.lessonVideoItem = const <LessonVideoItem>[],
      this.isPlay = false,
      this.initializeVideoPlayerFuture,
      this.videoIndex=0});

  LearningStates copyWith(
      {List<LessonVideoItem>? lessonVideoItem,
      bool? isPlay,
      Future<void>? initializeVideoPlayerFuture,
      int? videoIndex}) {
    return LearningStates(
        lessonVideoItem: lessonVideoItem ?? this.lessonVideoItem,
        isPlay: isPlay ?? this.isPlay,
        initializeVideoPlayerFuture:
            initializeVideoPlayerFuture ?? this.initializeVideoPlayerFuture,
        videoIndex: videoIndex??this.videoIndex);
  }

  @override
  List<Object?> get props => [lessonVideoItem, initializeVideoPlayerFuture, isPlay, videoIndex];
}