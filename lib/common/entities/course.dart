import 'package:cloud_firestore/cloud_firestore.dart';

class CourseRequestEntity {
  int? id;
  String? name;

  CourseRequestEntity({
    this.id,
    this.name
  });

  Map<String, dynamic> toJson() => {
        "id": id,
    "name": name,
      };

}

// class MyCourseRequestEntity {
//   int? courseId;
//   // String? name;
//
//   MyCourseRequestEntity({
//     this.courseId,
//     // this.name
//   });
//
//   Map<String, dynamic> toJson() => {
//     "courseId": courseId,
//     // "name": name,
//   };
// }


class SearchRequestEntity {
  String? search;

  SearchRequestEntity({
    this.search,
  });

  Map<String, dynamic> toJson() => {
        "search": search,
      };
}

class CourseListResponseEntity {
  List<CourseItem>? data;

  CourseListResponseEntity({
    this.data,
  });

  factory CourseListResponseEntity.fromJson(dynamic json) {
    if (json is List) {
      return CourseListResponseEntity(
        data: List<CourseItem>.from(json.map((x) => CourseItem.fromJson(x))),
      );
    } else if (json is Map<String, dynamic>) {
      return CourseListResponseEntity(
        data: json["data"] == null
            ? []
            : List<CourseItem>.from(
                json["data"].map((x) => CourseItem.fromJson(x))),
      );
    } else {
      throw FormatException("Invalid JSON format");
    }
  }
}

//api post response msg
class CourseDetailResponseEntity {
  int? code;
  String? msg;
  CourseItem? data;

  CourseDetailResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory CourseDetailResponseEntity.fromJson(Map<String, dynamic> json) =>
      CourseDetailResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: CourseItem.fromJson(json["data"]),
      );
}

class AuthorRequestEntity {
  String? token;

  AuthorRequestEntity({
    this.token,
  });

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}

//api post response msg
class AuthorResponseEntity {
  int? code;
  String? msg;
  AuthorItem? data;

  AuthorResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory AuthorResponseEntity.fromJson(Map<String, dynamic> json) =>
      AuthorResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: AuthorItem.fromJson(json["data"]),
      );
}

// login result
class AuthorItem {
  String? token;
  String? name;
  String? description;
  String? avatar;
  String? job;
  int? follow;
  int? score;
  int? download;
  int? online;

  AuthorItem({
    this.token,
    this.name,
    this.description,
    this.avatar,
    this.job,
    this.follow,
    this.score,
    this.download,
    this.online,
  });

  factory AuthorItem.fromJson(Map<String, dynamic> json) => AuthorItem(
        token: json["token"],
        name: json["name"],
        description: json["description"],
        avatar: json["avatar"],
        job: json["job"],
        follow: json["follow"],
        score: json["score"],
        download: json["download"],
        online: json["online"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "name": name,
        "description": description,
        "avatar": avatar,
        "job": job,
        "follow": follow,
        "score": score,
        "download": download,
        "online": online,
      };
}

class CourseItem {
  int? id;
  String? name;
  String? description;
  String? slug;
  String? image;
  int? progress;
  String? requirement;
  double? rating;
  double? price;
  int? enrollmentCount;
  int? level;
  int? status;
  String? published_at;
  double? net_price;
  String? duration;
  List<String>? sections;
  String? category_name;
  String? author_name;
  String? author_image;
  int? category_id;
  int? author_id;
  String? tags;
  String? achievements;

  //chua co trong api course detail
  String? comment;
  String? category_description;
  double? userRating;
  String? updated_by;
  String? category_slug;

  CourseItem({
    this.name,
    this.id,
    this.comment,
    this.level,
    this.progress,
    this.tags,
    this.duration,
    this.sections,
    this.status,
    this.description,
    this.enrollmentCount,
    this.price,
    this.net_price,
    this.slug,
    this.rating,
    this.requirement,
    this.achievements,
    this.image,
    this.category_description,
    this.userRating,
    this.author_name,
    this.updated_by,
    this.author_id,
    this.author_image,
    this.category_slug,
    this.category_name,
    this.category_id,
  });

  factory CourseItem.fromJson(Map<String, dynamic> json) => CourseItem(
        name: json["name"],
        id: json["id"],
        comment: json["comment"],
        level: json["level"],
        progress: json["progress"],
        tags: json["tags"],
        duration: json["duration"] is int ? json["duration"].toString() : json["duration"],
        sections: json["sections"] != null ? List<String>.from(json["sections"].map((x) => x)) : null,
        status: json["status"],
        description: json["description"],
        enrollmentCount: json["enrollmentCount"],
        price: json["price"],
        net_price: json["net_price"],
        slug: json["slug"],
        rating: json["rating"],
        requirement: json["requirement"],
        achievements: json["achievements"],
        image: json["image"],
        category_description: json["category_description"],
        userRating: json["userRating"],
        author_name: json["author_name"],
        updated_by: json["updated_by"],
        author_id: json["author_id"],
        author_image: json["author_image"],
        category_slug: json["category_slug"],
        category_name: json["category_name"],
        category_id: json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "comment": comment,
        "level": level,
        "progress": progress,
        "tags": tags,
        "duration": duration,
        "status": status,
        "description": description,
        "enrollmentCount": enrollmentCount,
        "price": price,
        "net_price": net_price,
        "slug": slug,
        "rating": rating,
        "requirement": requirement,
        "achievements": achievements,
        "image": image,
        "category_description": category_description,
        "userRating": userRating,
        "author_name": author_name,
        "updated_by": updated_by,
        "author_id": author_id,
        "author_image": author_image,
        "category_slug": category_slug,
        "category_name": category_name,
        "category_id": category_id,
      };
}

// login result
// class CourseItem {
//   String? user_token;
//   String? name;
//   String? description;
//   String? thumbnail;
//   String? video;
//   String? price;
//   String? amount_total;
//   int? lesson_num;
//   int? video_len;
//   int? down_num;
//   int? follow;
//   int? score;
//   int? id;
//
//   CourseItem({
//     this.user_token,
//     this.name,
//     this.description,
//     this.thumbnail,
//     this.video,
//     this.price,
//     this.amount_total,
//     this.lesson_num,
//     this.video_len,
//     this.down_num,
//     this.follow,
//     this.score,
//     this.id,
//   });
//
//   factory CourseItem.fromJson(Map<String, dynamic> json) =>
//       CourseItem(
//         user_token: json["user_token"],
//         name: json["name"],
//         description: json["description"],
//         thumbnail: json["thumbnail"],
//         video: json["video"],
//         price: json["price"],
//         amount_total: json["amount_total"],
//         lesson_num: json["lesson_num"],
//         video_len: json["video_len"],
//         down_num: json["down_num"],
//         follow: json["follow"],
//         score: json["score"],
//         id: json["id"],
//       );
//
//   Map<String, dynamic> toJson() => {
//     "user_token": user_token,
//     "name": name,
//     "description": description,
//     "thumbnail": thumbnail,
//     "video": video,
//     "price": price,
//     "amount_total": amount_total,
//     "lesson_num": lesson_num,
//     "video_len": video_len,
//     "down_num": down_num,
//     "follow": follow,
//     "score": score,
//     "id": id,
//   };
// }
