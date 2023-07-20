import 'package:course_application_mobile/common/entities/section.dart';

import '../../../../common/entities/course.dart';
import '../../../../common/entities/lesson.dart';

abstract class MyCourseDetailEvents{
  const MyCourseDetailEvents();
}

class TriggerMyCourseDetail extends MyCourseDetailEvents{
  const TriggerMyCourseDetail(this.courseItem):super();
  final CourseItem courseItem;
}

class TriggerMySectionList extends MyCourseDetailEvents{
  const TriggerMySectionList(this.sectionItem):super();
  final List<SectionItem> sectionItem;
}

class TriggerMyLessonList extends MyCourseDetailEvents{
  const TriggerMyLessonList(this.lessonItem):super();
  final List<LessonItem> lessonItem;
}