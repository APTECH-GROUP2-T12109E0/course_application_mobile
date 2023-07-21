class SectionRequestEntity {
  // int? id;
  int? courseId;
  int? sectionId;

  SectionRequestEntity({
    // this.id,
    this.courseId,
    this.sectionId,
  });

  Map<String, dynamic> toJson() => {
    // "id": id,
    "courseId": courseId,
    "sectionId": sectionId,
  };
}

class SectionResponseEntity {
  List<SectionItem>? sections;

  SectionResponseEntity({
    this.sections,
  });

  factory SectionResponseEntity.fromJson(dynamic json) {
    if (json is List) {
      return SectionResponseEntity(
        sections:
        List<SectionItem>.from(json.map((x) => SectionItem.fromJson(x))),
      );
    } else if (json is Map<String, dynamic>) {
      return SectionResponseEntity(
        sections: json["sections"] == null
            ? []
            : List<SectionItem>.from(
            json["sections"].map((x) => SectionItem.fromJson(x))),
      );
    } else {
      throw FormatException("Invalid JSON format");
    }
  }
}

class SectionItem {
  String? name;
  int? id;
  int? courseId;
  int? ordered;
  int? status;

  SectionItem({
    this.name,
    this.id,
    this.courseId,
    this.ordered,
    this.status,
  });

  factory SectionItem.fromJson(Map<String, dynamic> json) => SectionItem(
    name: json["name"],
    id: json["id"],
    courseId: json["courseId"],
    ordered: json["ordered"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "courseId": courseId,
    "ordered": ordered,
    "status": status,
  };
}