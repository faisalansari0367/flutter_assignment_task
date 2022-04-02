import 'dart:convert';

import 'package:flutter_assignment_task/models/user/user_response.dart';

import 'api_methods.dart';

class ApiService {
  static Future<UserResponse> login(String email, String password) async {
    final params = {'email': email, 'password': password};
    final result = await ApiMethods.post('login', body: params);
    final json = jsonDecode(result.body);
    final userResponse = UserResponse.fromJson(json);
    return userResponse;
  }

  static Future<UserResponse> register({
    required String email,
    required String password,
    required String mobileNo,
    required String cPassword,
    required String gender,
    required String dob,
    required String fullName,
  }) async {
    final params = {
      'email': email,
      'password': password,
      'full_name': fullName,
      'mobile_no': mobileNo,
      'c_password': cPassword,
      'gender': gender,
      'dob': dob
    };
    final result = await ApiMethods.post('register', body: params);
    final json = jsonDecode(result.body);
    if (json['success']) {
      final userResponse = UserResponse.fromJson(json);
      return userResponse;
    } else {
      throw Exception(json['message']);
    }
  }

  static Future<UserResponse> udpateProfileDetails({
    required String mobileNo,
    required String gender,
    required String dob,
    required String fullName,
    required String token,
  }) async {
    final params = {'full_name': fullName, 'mobile_no': mobileNo, 'gender': gender, 'dob': dob};
    final headers = {'Authorization': 'Bearer $token'};
    final result = await ApiMethods.post('updateProfileDetails', body: params, headers: headers);
    final json = jsonDecode(result.body);
    if (json['success']) {
      final userResponse = UserResponse.fromJson(json);
      return userResponse;
    } else {
      throw Exception(json['message']);
    }
  }
}
