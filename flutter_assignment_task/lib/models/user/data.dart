import 'package:flutter_assignment_task/models/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  final User userDetails;
  final String? token;

  Data({required this.userDetails, this.token});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  /// Connect the generated [_$DataToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
