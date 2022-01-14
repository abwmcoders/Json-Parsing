
import 'package:dio/dio.dart';

class GeneralNetworkService {
  late Dio _dio;

  final baseUrl  = "https://reqres.in/";

  GeneralNetworkService() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      ));

      initializeInterceptors();
  }

  Future<Response> getRequest(String endPoint) async {
    Response response;
    try{
      response = await _dio.get(endPoint);
    } on DioError catch(e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
    
  }

  initializeInterceptors() {
  _dio.interceptors.add(InterceptorsWrapper(
    onError: (error, handler){
      print(error.message);
      return handler.next(error);
    },

    onRequest: (request, handler){
      print("${request.method} ${request.path}");
      return handler.next(request);
    },

    onResponse: (response, handler) {
      print(response.data);
      return handler.next(response);
    }
  ));
}

}

