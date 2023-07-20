import 'package:course_application_mobile/common/entities/entities.dart';
import 'package:course_application_mobile/common/entities/section.dart';
import 'package:equatable/equatable.dart';

class MySectionDetailStates {
  final SectionItem? sectionItem;
  final List<SectionItem> sectionList;
  final List<LessonItem> lessonList;

  const MySectionDetailStates({
    this.sectionItem,
    this.sectionList = const <SectionItem>[],
    this.lessonList = const <LessonItem>[],
  });

  MySectionDetailStates copyWith({
    SectionItem? sectionItem,
    List<SectionItem>? sectionList,
    List<LessonItem>? lessonList,
  }) {
    return MySectionDetailStates(
        sectionItem: sectionItem ?? this.sectionItem,
        sectionList: sectionList ?? this.sectionList,
        lessonList: lessonList ?? this.lessonList);
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
