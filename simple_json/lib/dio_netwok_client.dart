

import 'package:dio/dio.dart';
import 'package:simple_json/user_model.dart';

class DioNetworkClient {
  final Dio _dio = Dio();
  final baseUrl = "https://reqres.in/api";


  Future<UserDetails?> getUser(String id) async {
    UserDetails? userDetails;
    try{
      Response response = await _dio.get(baseUrl + "/users/$id");
    print("Usert Details: ${response.data}");
    UserDetails userDetails = UserDetails.fromJson(response.data);
    return userDetails;
    }on DioError catch(e){
      if (e.response != null) {
      print('Dio error!');
      print('STATUS: ${e.response?.statusCode}');
      print('DATA: ${e.response?.data}');
      print('HEADERS: ${e.response?.headers}');
    } else {
      // Error due to setting up or sending the request
      print('Error sending request!');
      print(e.message);
    }
    }
    return userDetails;
  }
}