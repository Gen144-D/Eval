import 'package:json_annotation/json_annotation.dart';

part 'course_model.g.dart';

@JsonSerializable()
class Course {
  final int id;
  final String courseCode;
  final String courseName;
  final String? description;
  final int? credits;
  final List<Course>? prerequisites;

  Course({
    required this.id,
    required this.courseCode,
    required this.courseName,
    this.description,
    this.credits,
    this.prerequisites,
  });

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
