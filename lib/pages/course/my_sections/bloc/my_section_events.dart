import 'package:equatable/equatable.dart';

import '../../../../common/entities/lesson.dart';
import '../../../../common/entities/section.dart';

abstract class MySectionDetailEvents{
  const MySectionDetailEvents();
}

// class TriggerSectionDetail extends MySectionDetailEvents{
//   const TriggerSectionDetail(this.sectionDetail):super();
//   final SectionItem sectionDetail;
// }
//
// class TriggerMySectionList extends MySectionDetailEvents{
//   const TriggerMySectionList(this.sectionItem):super();
//   final List<SectionItem> sectionItem;
// }
//
// class TriggerMyLessonList extends MySectionDetailEvents{
//   const TriggerMyLessonList(this.lessonItem):super();
//   final List<LessonItem> lessonItem;
// }

class TriggerMySectionItem extends MySectionDetailEvents{
  const TriggerMySectionItem(this.sectionItem):super();
  final SectionItem sectionItem;
}

class TriggerMySectionList extends MySectionDetailEvents{
  const TriggerMySectionList(this.sectionList):super();
  final List<SectionItem> sectionList;
}

class TriggerMyLessonList extends MySectionDetailEvents{
  const TriggerMyLessonList(this.lessonList):super();
  final List<LessonItem> lessonList;
}
