import 'package:course_application_mobile/common/entities/entities.dart';
import 'package:course_application_mobile/common/entities/section.dart';
import 'package:course_application_mobile/global.dart';
import '../utils/http_util.dart';

class SectionAPI {
  static Future<SectionResponseEntity> sectionList(
      {SectionRequestEntity? params}) async {
    var response = await HttpUtil().get(
      'course/${params?.courseId}/section',
      // data: data,
      queryParameters: params?.toJson(),
    );

    return SectionResponseEntity.fromJson(response.data);
  }

  static Future<SectionItem> getSectionByCourseId(
      {SectionRequestEntity? params}) async {
    var response = await HttpUtil().get(
      'course/{id}/section/${params?.sectionId}',
      // data: data,
      queryParameters: params?.toJson(),
    );

    return SectionItem.fromJson(response.data);
  }

  static Future<LessonListResponseEntity> lessonList(
      {SectionRequestEntity? params}) async {
    print("before call lesson list");
    var response = await HttpUtil().get(
      'section/${params?.sectionId}/lesson',
      queryParameters: params?.toJson(),
    );
    print("after call lesson list");

    return LessonListResponseEntity.fromJson(response.data);
  }

  // static Future<LessonDetailResponseEntity> lessonDetail(
  //     {SectionRequestEntity? params}) async {
  //   print("before call detail lesson");
  //   var response = await HttpUtil().get(
  //     'section/${params?.id}/lesson',
  //     queryParameters: params?.toJson(),
  //   );
  //   print("after call detail lesson");
  //
  //   return LessonDetailResponseEntity.fromJson(response.data);
  // }
}
