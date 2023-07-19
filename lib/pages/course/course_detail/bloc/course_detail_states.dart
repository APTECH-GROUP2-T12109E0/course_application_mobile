import 'package:course_application_mobile/common/entities/section.dart';

import '../../../../common/entities/course.dart';
import '../../../../common/entities/lesson.dart';

class CourseDetailStates {
  const CourseDetailStates({
    this.courseItem,
    this.sectionItem = const <SectionItem>[],
    this.lessonItem = const <LessonItem>[],
  });

  final CourseItem? courseItem;
  final List<SectionItem> sectionItem;
  final List<LessonItem> lessonItem;

  CourseDetailStates copyWith(
      {CourseItem? courseItem,List<SectionItem>? sectionItem, List<LessonItem>? lessonItem}) {
    return CourseDetailStates(
        courseItem: courseItem ?? this.courseItem,
        sectionItem: sectionItem ?? this.sectionItem,
        lessonItem: lessonItem ?? this.lessonItem);
  }
}
