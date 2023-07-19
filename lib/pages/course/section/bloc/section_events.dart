import 'package:equatable/equatable.dart';

import '../../../../common/entities/lesson.dart';
import '../../../../common/entities/section.dart';

abstract class SectionDetailEvents{
  const SectionDetailEvents();
}

// class TriggerSectionDetail extends SectionDetailEvents{
//   const TriggerSectionDetail(this.sectionDetail):super();
//   final SectionItem sectionDetail;
// }
//
// class TriggerSectionList extends SectionDetailEvents{
//   const TriggerSectionList(this.sectionItem):super();
//   final List<SectionItem> sectionItem;
// }
//
// class TriggerLessonList extends SectionDetailEvents{
//   const TriggerLessonList(this.lessonItem):super();
//   final List<LessonItem> lessonItem;
// }

class TriggerSectionItem extends SectionDetailEvents{
  const TriggerSectionItem(this.sectionItem):super();
  final SectionItem sectionItem;
}

class TriggerSectionList extends SectionDetailEvents{
  const TriggerSectionList(this.sectionList):super();
  final List<SectionItem> sectionList;
}

class TriggerLessonList extends SectionDetailEvents{
  const TriggerLessonList(this.lessonList):super();
  final List<LessonItem> lessonList;
}
