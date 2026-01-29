// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recommendation _$RecommendationFromJson(
  Map<String, dynamic> json,
) => Recommendation(
  id: json['id'] as int,
  studentId: json['student_id'] as int? ?? json['studentId'] as int,
  courseId: json['course_id'] as int? ?? json['courseId'] as int,
  courseCode: json['course_code'] as String? ?? json['courseCode'] as String,
  courseName: json['course_name'] as String? ?? json['courseName'] as String,
  description: json['description'] as String?,
  reason: json['reason'] as String?,
  confidenceScore:
      (json['confidence_score'] as num? ?? json['confidenceScore'] as num)
          .toDouble(),
  credits: json['credits'] as int?,
);

Map<String, dynamic> _$RecommendationToJson(Recommendation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'student_id': instance.studentId,
      'course_id': instance.courseId,
      'course_code': instance.courseCode,
      'course_name': instance.courseName,
      'description': instance.description,
      'reason': instance.reason,
      'confidence_score': instance.confidenceScore,
      'credits': instance.credits,
    };
