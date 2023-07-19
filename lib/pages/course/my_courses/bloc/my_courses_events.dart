import '../../../../common/entities/course.dart';
//theo từng state sẽ dùng cho 1 class khác
//=> có thể check từng state type
abstract class MyCoursesEvents{
  const MyCoursesEvents();
}

class TriggerInitialMyCoursesEvents extends MyCoursesEvents{
  const TriggerInitialMyCoursesEvents();
}

class TriggerLoadingMyCoursesEvents extends MyCoursesEvents{
  const TriggerLoadingMyCoursesEvents();
}

class TriggerDoneLoadingMyCoursesEvents extends MyCoursesEvents{
  const TriggerDoneLoadingMyCoursesEvents();
}

class TriggerLoadedMyCoursesEvents extends MyCoursesEvents{
  const TriggerLoadedMyCoursesEvents(this.courseItem);
  final List<CourseItem> courseItem;
}