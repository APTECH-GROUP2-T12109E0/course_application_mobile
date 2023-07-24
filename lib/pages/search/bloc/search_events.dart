import '../../../common/entities/course.dart';

class SearchEvents{

}

class TriggerSearchEvents extends SearchEvents{
  TriggerSearchEvents(this.courseItem);
  final List<CourseItem> courseItem;
}