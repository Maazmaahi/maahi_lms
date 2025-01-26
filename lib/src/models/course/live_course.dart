part of "../models.dart";

class LiveCourse extends Course {
  final String liveStreamingUrl;
  final String liveDuration;
  final DateTime liveTime;

  LiveCourse({
    required super.id,
    required super.title,
    super.description,
    required super.level,
    required super.imageUrl,
    required super.teacher,
    super.countStudents = 0,
    required super.createdAt,
    required this.liveStreamingUrl,
    required this.liveDuration,
    required this.liveTime,
  });

  factory LiveCourse.fromJson(Map<String, dynamic> json) {
    return LiveCourse(
      id: int.tryParse(json["id"].toString()) ?? 0,
      title: json["title"],
      description: json["description"],
      level: json["level"],
      imageUrl: json["imageUrl"],
      teacher: Teacher.fromJson(json["teacher"]),
      countStudents: int.tryParse(json["countStudents"].toString()) ?? 0,
      createdAt: DateTime.parse(json["createdAt"].toString()),
      liveStreamingUrl: json["liveStreamingUrl"] ?? "",
      liveDuration: json["liveDuration"],
      liveTime: DateTime.parse(json["liveTime"].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "level": level,
    "imageUrl": imageUrl,
    "teacher": teacher.toJson(),
    "countStudents": countStudents,
    "createdAt": createdAt,
    "liveStreamingUrl": liveStreamingUrl,
    "liveDuration": liveDuration,
    "liveTime": liveTime,
  };
}
