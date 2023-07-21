import '../entities/course.dart';
import '../entities/lesson.dart';
import '../utils/http_util.dart';

class LessonAPI {
  static Future<LessonListResponseEntity> lessonList(
      {LessonRequestEntity? params}) async {

    var response = await HttpUtil().get(
      'section/${params?.id}/lesson',
      queryParameters: params?.toJson(),
    );

    return LessonListResponseEntity.fromJson(response.data);
    // return LessonListResponseEntity.fromJson(response.data);
  }

  // static Future<LessonDetailResponseEntity> getTracksByCourseId(
  //     {CourseRequestEntity? params}) async {
  //   print("before call lesson video");
  //   var response = await HttpUtil()
  //       .post('track/learning/${params?.id}', queryParameters: params?.toJson());
  //   // print(response.toString());
  //   print("after call lesson video");
  //   return LessonDetailResponseEntity.fromJson(response);
  // }

  static Future<LessonVideoItem> getTrackByLessonId(
      {LessonRequestEntity? params}) async {
    var response = await HttpUtil()
        .get('lesson/${params?.lessonId}/video', queryParameters: params?.toJson());
    print("after call lesson video");
    return LessonVideoItem.fromJson(response.data);
  }
}