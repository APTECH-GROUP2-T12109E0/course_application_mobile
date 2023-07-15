import '../entities/base.dart';
import '../entities/course.dart';
import '../utils/http_util.dart';

class CourseAPI{
  static Future<CourseListResponseEntity> courseList() async {
   var response = await HttpUtil().get(
      'course'
    );

   print("ok");

   return CourseListResponseEntity.fromJson(response.data);
  }
  static Future<CourseDetailResponseEntity> courseDetail({CourseRequestEntity? params}) async {
    var response = await HttpUtil().post(
        'api/courseDetail',
      queryParameters: params?.toJson()
    );
   // print(response.toString());
    return CourseDetailResponseEntity.fromJson(response);
  }

  //for course payment
  static Future<BaseResponseEntity> coursePay({CourseRequestEntity? params}) async {
   var response=  await HttpUtil().post(
      'api/checkout',
      queryParameters: params?.toJson(),

    );

    return BaseResponseEntity.fromJson(response);
  }
}