import '../../global.dart';
import '../entities/base.dart';
import '../entities/course.dart';
import '../utils/http_util.dart';

class CourseAPI{
  static Future<CourseListResponseEntity> courseList() async {
   var response = await HttpUtil().get(
      'course'
    );

   return CourseListResponseEntity.fromJson(response.data);
  }
  // static Future<CourseDetailResponseEntity> courseDetail({CourseRequestEntity? params}) async {
  //   var response = await HttpUtil().post(
  //       'course',
  //     queryParameters: params?.toJson()
  //   );
  //  // print(response.toString());
  //   return CourseDetailResponseEntity.fromJson(response);
  // }

  static Future<CourseItem> courseDetail({CourseRequestEntity? params}) async {
    var data = {
      "accessToken": Global.storageService.getUserToken(),
    };

    var response = await HttpUtil().get(
        'course/${params?.id}',
        data: data,
        queryParameters: params?.toJson()
    );
    print("call ok");

    // var test = CourseItem.fromJson(response.data);
    print("ok thach dump");
    // return CourseItem();
    return CourseItem.fromJson(response.data);
  }

  //for course payment
  // static Future<BaseResponseEntity> coursePay({CourseRequestEntity? params}) async {
  //  var response=  await HttpUtil().post(
  //     'checkout',
  //     queryParameters: params?.toJson(),
  //
  //   );
  //
  //   return BaseResponseEntity.fromJson(response);
  // }
}