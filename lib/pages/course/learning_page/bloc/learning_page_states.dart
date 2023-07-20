import 'package:equatable/equatable.dart';

import '../../../../common/entities/lesson.dart';

class LearningStates extends Equatable {
  final LessonVideoItem? lessonVideoItem;

  // final List<LessonVideoItem> lessonVideoItem;
  final Future<void>? initializeVideoPlayerFuture;
  final bool isPlay;
  final int videoIndex;

  //phần thêm
  final List<LessonItem> lessonList;

  const LearningStates({
    this.lessonVideoItem,
    this.isPlay = false,
    this.initializeVideoPlayerFuture,
    this.videoIndex = 0,
    //phần thêm
    this.lessonList = const <LessonItem>[],
  });

  LearningStates copyWith( // {List<LessonVideoItem>? lessonVideoItem,
      {
    LessonVideoItem? lessonVideoItem,
    bool? isPlay,
    Future<void>? initializeVideoPlayerFuture,
    int? videoIndex,
    //phần thêm
    List<LessonItem>? lessonList,
  }) {
    return LearningStates(
        lessonVideoItem: lessonVideoItem ?? this.lessonVideoItem,
        isPlay: isPlay ?? this.isPlay,
        initializeVideoPlayerFuture:
            initializeVideoPlayerFuture ?? this.initializeVideoPlayerFuture,
        videoIndex: videoIndex ?? this.videoIndex,
        //phần thêm
        lessonList: lessonList ?? this.lessonList);
  }

  @override
  List<Object?> get props => [
        lessonVideoItem,
        initializeVideoPlayerFuture,
        isPlay,
        videoIndex,
        lessonList
      ];
}
