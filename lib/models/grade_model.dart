import 'package:json_annotation/json_annotation.dart';

part 'grade_model.g.dart';

@JsonSerializable()
class Grade {
  final int id;
  final int studentId;
  final int courseId;
  final double grade;
  final String semester;
  final String academicYear;
  final String? courseCode;
  final String? courseName;
  final int? credits;

  Grade({
    required this.id,
    required this.studentId,
    required this.courseId,
    required this.grade,
    required this.semester,
    required this.academicYear,
    this.courseCode,
    this.courseName,
    this.credits,
  });

  factory Grade.fromJson(Map<String, dynamic> json) => _$GradeFromJson(json);
  Map<String, dynamic> toJson() => _$GradeToJson(this);
}
