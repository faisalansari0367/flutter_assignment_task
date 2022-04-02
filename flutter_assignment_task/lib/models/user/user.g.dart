// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      name: json['name'] as String,
      fullName: json['full_name'] as String,
      email: json['email'] as String,
      mobileNo: json['mobile_no'] as String,
      emailVerifiedAt: json['email_verified_at'] as String?,
      gender: json['gender'] as String,
      dob: DateTime.parse(json['dob'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'full_name': instance.fullName,
      'email': instance.email,
      'mobile_no': instance.mobileNo,
      'email_verified_at': instance.emailVerifiedAt,
      'gender': instance.gender,
      'dob': instance.dob.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
