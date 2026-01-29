// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
  id: json['id'] as int,
  courseCode: json['course_code'] as String? ?? json['courseCode'] as String,
  courseName: json['course_name'] as String? ?? json['courseName'] as String,
  description: json['description'] as String?,
  credits: json['credits'] as int?,
  prerequisites: (json['prerequisites'] as List<dynamic>?)
      ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
  'id': instance.id,
  'course_code': instance.courseCode,
  'course_name': instance.courseName,
  'description': instance.description,
  'credits': instance.credits,
  'prerequisites': instance.prerequisites,
};
