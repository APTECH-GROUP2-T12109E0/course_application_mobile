import '../../../../common/entities/course.dart';
import '../../../../common/entities/section.dart';
abstract class MyCoursesStates{

// class MyCoursesStates{
  const MyCoursesStates(
    // this.courseItem = const  <CourseItem>[],
    // this.index=0

);

  // get sectionItem => null;
  // final int index;
  // final List<CourseItem> courseItem;
  // MyCoursesStates copyWith({int? index, List<CourseItem>? courseItem}){
  //   return MyCoursesStates(
  //       courseItem:courseItem??this.courseItem,
  //       index:index??this.index
  //   );
  // }
}

class InitialMyCoursesStates extends MyCoursesStates{
  const InitialMyCoursesStates();
}

class LoadingMyCoursesStates extends MyCoursesStates{
  const LoadingMyCoursesStates();
}

class DoneLoadingMyCoursesStates extends MyCoursesStates{
  const DoneLoadingMyCoursesStates();
}

class LoadedMyCoursesStates extends MyCoursesStates{
  const LoadedMyCoursesStates(this.courseItem);
  final List<CourseItem> courseItem;
}
