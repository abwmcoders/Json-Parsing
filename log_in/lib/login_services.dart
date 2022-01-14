import 'package:dio/dio.dart';
import 'log_in_interface.dart';
import 'model/user_model.dart';

class LogInServices extends ILogin {
  @override
  Future<UserModel> login(String email, String password) async {
    final api = "https://reqres.in/api/login";
    final data = {
      "email" : email,
      "password" : password
    };
    final dio = Dio();
    Response response = await dio.post(api, data);
    if (response.statusCode == 200) {
      final body = response.data;
      return UserModel(email : email, body["token"]);
    } else {
      return null;
    }
  }
}