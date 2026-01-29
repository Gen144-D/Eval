// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: json['id'] as int,
  email: json['email'] as String,
  firstName: json['first_name'] as String? ?? json['firstName'] as String,
  lastName: json['last_name'] as String? ?? json['lastName'] as String,
  role: json['role'] as String,
  studentId: json['student_id'] as String? ?? json['studentId'] as String?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'role': instance.role,
  'student_id': instance.studentId,
};
