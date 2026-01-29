import 'package:json_annotation/json_annotation.dart';

part 'recommendation_model.g.dart';

@JsonSerializable()
class Recommendation {
  final int id;
  final int studentId;
  final int courseId;
  final String courseCode;
  final String courseName;
  final String? description;
  final String? reason;
  final double confidenceScore;
  final int? credits;

  Recommendation({
    required this.id,
    required this.studentId,
    required this.courseId,
    required this.courseCode,
    required this.courseName,
    this.description,
    this.reason,
    required this.confidenceScore,
    this.credits,
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) =>
      _$RecommendationFromJson(json);
  Map<String, dynamic> toJson() => _$RecommendationToJson(this);
}
