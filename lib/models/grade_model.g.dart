// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grade_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Grade _$GradeFromJson(Map<String, dynamic> json) => Grade(
  id: json['id'] as int,
  studentId: json['student_id'] as int? ?? json['studentId'] as int,
  courseId: json['course_id'] as int? ?? json['courseId'] as int,
  grade: (json['grade'] as num).toDouble(),
  semester: json['semester'] as String,
  academicYear:
      json['academic_year'] as String? ?? json['academicYear'] as String,
  courseCode: json['course_code'] as String? ?? json['courseCode'] as String?,
  courseName: json['course_name'] as String? ?? json['courseName'] as String?,
  credits: json['credits'] as int?,
);

Map<String, dynamic> _$GradeToJson(Grade instance) => <String, dynamic>{
  'id': instance.id,
  'student_id': instance.studentId,
  'course_id': instance.courseId,
  'grade': instance.grade,
  'semester': instance.semester,
  'academic_year': instance.academicYear,
  'course_code': instance.courseCode,
  'course_name': instance.courseName,
  'credits': instance.credits,
};
