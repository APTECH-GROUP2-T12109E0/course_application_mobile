
import 'package:cloud_firestore/cloud_firestore.dart';

class LessonRequestEntity {
  int? id;
  int? lessonId;
  LessonRequestEntity({
    this.id,
    this.lessonId,

  });

  Map<String, dynamic> toJson() => {
    "id": id,
    "lessonId": lessonId,

  };
}


// class LessonListResponseEntity {
//   List<LessonItem>? data;
//
//   LessonListResponseEntity({
//     this.data,
//   });
//
//   factory LessonListResponseEntity.fromJson(Map<String, dynamic> json) =>
//       LessonListResponseEntity(
//         data: json["data"] == null ? [] : List<LessonItem>.from(json["data"].map((x) => LessonItem.fromJson(x))),
//       );
// }

class LessonListResponseEntity {
  List<LessonItem>? lessons;

  LessonListResponseEntity({
    this.lessons,
  });

  factory LessonListResponseEntity.fromJson(dynamic json) {
    if (json is List) {
      return LessonListResponseEntity(
        lessons:
        List<LessonItem>.from(json.map((x) => LessonItem.fromJson(x))),
      );
    } else if (json is Map<String, dynamic>) {
      return LessonListResponseEntity(
        lessons: json["lessons"] == null
            ? []
            : List<LessonItem>.from(
            json["lessons"].map((x) => LessonItem.fromJson(x))),
      );
    } else {
      throw FormatException("Invalid JSON format");
    }
  }
}

class LessonItem {
  int? id;
  String? name;
  String? description;
  int? duration;
  int? sectionId;
  int? status;
  int? ordered;
  bool? completed;

  LessonItem({
    this.id,
    this.name,
    this.description,
    this.duration,
    this.sectionId,
    this.status,
    this.ordered,
    this.completed,
  });

  factory LessonItem.fromJson(Map<String, dynamic> json) =>
      LessonItem(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        duration: json["duration"],
        sectionId: json["sectionId"],
        status: json["status"],
        ordered: json["ordered"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "duration": duration,
    "sectionId": sectionId,
    "status": status,
    "ordered": ordered,
    "completed": completed,
  };
}

class LessonDetailResponseEntity {
  // int? code;
  // String? msg;
  List<LessonVideoItem>? data;

  LessonDetailResponseEntity({
    // this.code,
    // this.msg,
    this.data,
  });

  factory LessonDetailResponseEntity.fromJson(dynamic json) {
    if (json is List) {
      return LessonDetailResponseEntity(
        data:
        List<LessonVideoItem>.from(json.map((x) => LessonVideoItem.fromJson(x))),
      );
    } else if (json is Map<String, dynamic>) {
      return LessonDetailResponseEntity(
        data: json["sections"] == null
            ? []
            : List<LessonVideoItem>.from(
            json["sections"].map((x) => LessonVideoItem.fromJson(x))),

      );
    } else {
      print("video");
      throw FormatException("Invalid JSON format");
    }
  }
  // factory LessonDetailResponseEntity.fromJson(Map<String, dynamic> json) =>
  //     LessonDetailResponseEntity(
  //       // code: json["code"],
  //       // msg: json["msg"],
  //       data: json["data"] == null ? [] : List<LessonVideoItem>.from(json["data"].map((x) => LessonVideoItem.fromJson(x))),
  //     );
}

//tạm ẩn
// class LessonDetailResponseEntity {
//   int? code;
//   String? msg;
//   List<LessonVideoItem>? data;
//
//   LessonDetailResponseEntity({
//     this.code,
//     this.msg,
//     this.data,
//   });
//
//
//   factory LessonDetailResponseEntity.fromJson(Map<String, dynamic> json) =>
//       LessonDetailResponseEntity(
//         code: json["code"],
//         msg: json["msg"],
//         data: json["data"] == null ? [] : List<LessonVideoItem>.from(json["data"].map((x) => LessonVideoItem.fromJson(x))),
//       );
// }

//tạm ẩn gốc
// class LessonVideoItem {
//   String? name;
//   String? url;
//   String? thumbnail;
//
//   LessonVideoItem({
//     this.name,
//     this.url,
//     this.thumbnail,
//   });
//
//   factory LessonVideoItem.fromJson(Map<String, dynamic> json) =>
//       LessonVideoItem(
//         name: json["name"],
//         url: json["url"],
//         thumbnail: json["thumbnail"],
//       );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "url": url,
//     "thumbnail": thumbnail,
//   };
//
// }

class LessonVideoItem {
  int? id; // id of Video
  String? name;
  String? url;
  Map<String, String>? captionUrls;
  Map<String, String>? captionData;
  int? status;
  int? lessonId;

  LessonVideoItem({
    this.id,
    this.name,
    this.url,
    this.captionUrls,
    this.captionData,
    this.status,
    this.lessonId,
  });

  factory LessonVideoItem.fromJson(Map<String, dynamic> json) =>
      LessonVideoItem(
        id: json['id'],
        name: json['name'],
        url: json['url'],
        captionUrls: json['captionUrls'],
        captionData: Map<String, String>.from(json['captionData']),
        status: json['status'],
        lessonId: json['lessonId'],
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'url': url,
    'captionUrls': captionUrls,
    'captionData': captionData,
    'status': status,
    'lessonId': lessonId,
  };

}