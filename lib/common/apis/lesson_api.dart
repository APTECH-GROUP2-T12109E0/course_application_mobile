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

  static Future<LessonDetailResponseEntity> lessonDetail(
      {LessonRequestEntity? params}) async {
    var response = await HttpUtil()
        .post('lesson/${params?.id}/video', queryParameters: params?.toJson());
    // print(response.toString());
    return LessonDetailResponseEntity.fromJson(response);
  }
}