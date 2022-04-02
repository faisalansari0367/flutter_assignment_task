import 'package:flutter/material.dart';
import 'package:flutter_assignment_task/services/api_service.dart';

import '../models/user/user.dart';
import '../widgets/my_snack_bar.dart';

enum Gender { MALE, FEMALE }

class UserModel extends ChangeNotifier {
  bool _isLoading = false;
  bool _isLoggedIn = false;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;
  String? email, password, fullName, lastName;
  String gender = Gender.MALE.name;
  String dob = '';
  String? token;
  User? user;
  int? userId;

  UserModel() {
    // getUser();
  }

  void setGender(String? gender) {
    this.gender = gender!;
    notifyListeners();
  }

  void setEmail(String? email) => this.email = email;

  void setPassword(String? password) => this.password = password;

  void setFirstName(String? firstName) => this.fullName = firstName;

  void setLastName(String? lastName) => this.lastName = lastName;

  Future<void> login() async {
    _setLoading(true);
    final result = await ApiService.login(email!, password!);
    if (result.success) {
      user = result.data?.userDetails;
      _isLoggedIn = true;
      token = result.data?.token;
      MySnackBar.show('Login success');
      // saveUserToStorage(user!);
    } else {
      MySnackBar.show(result.message);
    }
    _setLoading(false);
  }

  // Future<void> saveUserToStorage(User user) async {
  //   final json = user.toJson();
  //   await StorageService().saveUser(json);
  // }

  // Future<void> getUser() async {
  //   final result = StorageService().getUser();
  //   if (result.isEmpty) return;
  //   final user = User.fromJson(result);
  //   this.user = user;
  //   _isLoggedIn = true;
  //   notifyListeners();
  // }

  // Future<void> logout() async {
  //   await StorageService().removeUser();
  //   user = null;
  //   _isLoggedIn = false;
  //   MySnackBar.show('Logout success');
  //   notifyListeners();
  // }

  Future<void> signUp({
    required String email,
    required String password,
    required String mobileNo,
    required String cPassword,
    required String gender,
    required String dob,
    required String fullName,
  }) async {
    _setLoading(true);
    try {
      final userResponse = await ApiService.register(
        email: email,
        password: password,
        fullName: fullName,
        cPassword: cPassword,
        dob: dob,
        gender: gender,
        mobileNo: mobileNo,
      );
      // this.userId = userId;
      if (userResponse.success) {
        token = userResponse.data?.token;
        user = userResponse.data!.userDetails;
        MySnackBar.show(userResponse.message);
      }
    } catch (e) {
      MySnackBar.show(e.toString());
    }
    _setLoading(false);
  }

  Future<void> updateProfileDetails({
    required String mobileNo,
    required String gender,
    required String dob,
    required String fullName,
  }) async {
    _setLoading(true);
    try {
      final userResponse = await ApiService.udpateProfileDetails(
        fullName: fullName,
        dob: dob,
        gender: gender,
        mobileNo: mobileNo,
        token: token!,
      );
      // this.userId = userId;
      if (userResponse.success) {
        user = userResponse.data!.userDetails;
        MySnackBar.show(userResponse.message);
      }
    } catch (e) {
      MySnackBar.show(e.toString());
    }
    _setLoading(false);
  }

  // void updateUser(User user) {
  //   this.user = user;
  //   notifyListeners();
  // }

  // Future<void> editProfile({
  //   required String email,
  //   required String password,
  //   required String firstName,
  //   required String lastName,
  //   required int userId,
  // }) async {
  //   _setLoading(true);
  //   try {
  //     final result = await Api.editProfile(
  //       email: email,
  //       password: password,
  //       firstName: firstName,
  //       lastName: lastName,
  //       userId: userId,
  //     );
  //     MySnackBar.show('Profile updated successfully');
  //     updateUser(result);
  //   } on Exception catch (e) {
  //     MySnackBar.show(e.toString());
  //   }
  //   _setLoading(false);
  // }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
