import 'package:log_in/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class ILogin {
  Future<UserModel> login(String email, String password) async {
    final api = "https://reqres.in/api/login";
    final data = {
      "email" : email,
      "password" : password
    };
    final dio = Dio();
    final response = await dio.post(api, data);
    if (response.statusCode == 200) {
      final body = response.data;
      return UserModel(email : email, body["token"]);
    } else {
      return null;
    }
  }
}