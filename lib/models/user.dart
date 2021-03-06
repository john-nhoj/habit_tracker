import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  static final UserModel _instance = UserModel._internal();
  String _username, _token;
  bool _isAuthenticated = false;

  factory UserModel() {
    return _instance;
  }

  UserModel._internal();

  void updateUserProfile(Map<String, dynamic> json) {
    var userInfo = json['user'];
    _username = userInfo['username'];
    _token = json['token'];
    _isAuthenticated = true;
    notifyListeners();
  }

  String getUsername() => _username;
  String getToken() => _token;
  bool isAuthenticated() => _isAuthenticated;

  @override
  String toString() =>
      'username: $_username, isAuthenticated: $_isAuthenticated';
}
