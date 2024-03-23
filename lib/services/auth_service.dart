import 'package:flutter/material.dart';
import 'package:recipe_app/models/user.dart';
import 'package:recipe_app/services/http_service.dart';

class AuthService {
  static final AuthService _singleton = AuthService._internal();

  final _httpService = HTTPservice();

  User? user;

  factory AuthService() {
    return _singleton;
  }
  AuthService._internal();
  Future<bool> login(String username, String password) async {
    // print("$username - $password");
    try {
      var response = await _httpService.post("/auth/login", {
        "username": username,
        "password": password,
      });
      // debugPrint(response?.statusCode.toString());
      if (response?.statusCode == 200 && response?.data != null) {
        user = User.fromJson(response!.data);
        // print(user);
        HTTPservice().setup(bearerToken: user!.token);
        return true;
      }
    } catch (e) {
      debugPrint("$e");
    }
    return false;
  }
}
