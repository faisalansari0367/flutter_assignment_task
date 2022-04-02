import 'package:json_annotation/json_annotation.dart';


part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String name, fullName, email, mobileNo;
  final String? emailVerifiedAt;
  final String gender;
  final DateTime dob, createdAt, updatedAt;

  User({
    required this.id,
    required this.name,
    required this.fullName,
    required this.email,
    required this.mobileNo,
    this.emailVerifiedAt,
    required this.gender,
    required this.dob,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Connect the generated [_$UserToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
