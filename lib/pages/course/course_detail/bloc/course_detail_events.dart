import 'package:course_application_mobile/common/entities/section.dart';

import '../../../../common/entities/course.dart';
import '../../../../common/entities/lesson.dart';

abstract class CourseDetailEvents{
  const CourseDetailEvents();
}

class TriggerCourseDetail extends CourseDetailEvents{
  const TriggerCourseDetail(this.courseItem):super();
  final CourseItem courseItem;
}

class TriggerSectionList extends CourseDetailEvents{
  const TriggerSectionList(this.sectionItem):super();
  final List<SectionItem> sectionItem;
}

class TriggerLessonList extends CourseDetailEvents{
  const TriggerLessonList(this.lessonItem):super();
  final List<LessonItem> lessonItem;
}