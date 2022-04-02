import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  final bool success;
  final Data? data;
  final String message;

  UserResponse({this.success = false, this.data, required this.message});

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

  /// Connect the generated [_$UserResponseToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
