class CourseRequest {
  int? courseId;
  List<SectionDto>? sectionDto;
  List<LessonDto>? lessonDto;
  List<VideoDto>? videoDto;

  CourseRequest({this.courseId, this.sectionDto, this.lessonDto, this.videoDto});

  factory CourseRequest.fromJson(dynamic json) {
    if (json is List) {
      return CourseRequest(
        sectionDto:
        List<SectionDto>.from(json.map((x) => SectionDto.fromJson(x))),
      );
    } else if (json is Map<String, dynamic>) {
      return CourseRequest(
        sectionDto: json["sectionDto"] == null
            ? []
            : List<SectionDto>.from(
            json["sectionDto"].map((x) => SectionDto.fromJson(x))),
      );
    } else {
      throw FormatException("Invalid JSON format");
    }
  }
}
class SectionDto {
  int? id;
  String? name;
  int? courseId;
  int? status;
  int? ordered;

  SectionDto({this.id, this.name, this.courseId, this.status, this.ordered});

  SectionDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    courseId = json['courseId'];
    status = json['status'];
    ordered = json['ordered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['courseId'] = this.courseId;
    data['status'] = this.status;
    data['ordered'] = this.ordered;
    return data;
  }
}

class LessonDto {
  int? id;
  String? name;
  String? description;
  int? duration;
  int? sectionId;
  int? status;
  int? ordered;
  bool? completed;

  LessonDto({this.id, this.name, this.description, this.duration, this.sectionId, this.status, this.ordered, this.completed});

  LessonDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    duration = json['duration'];
    sectionId = json['sectionId'];
    status = json['status'];
    ordered = json['ordered'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['duration'] = this.duration;
    data['sectionId'] = this.sectionId;
    data['status'] = this.status;
    data['ordered'] = this.ordered;
    data['completed'] = this.completed;
    return data;
  }
}

class VideoDto {
  int? id;
  String? name;
  String? url;
  dynamic captionUrls;
  Map<String, String>? captionData;
  int? status;
  int? lessonId;

  VideoDto({this.id, this.name, this.url, this.captionUrls, this.captionData, this.status, this.lessonId});

  VideoDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    captionUrls = json['captionUrls'];
    captionData = json['captionData'] != null ? Map<String, String>.from(json['captionData']) : null;
    status = json['status'];
    lessonId = json['lessonId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    data['captionUrls'] = this.captionUrls;
    data['captionData'] = this.captionData;
    data['status'] = this.status;
    data['lessonId'] = this.lessonId;
    return data;
  }
}