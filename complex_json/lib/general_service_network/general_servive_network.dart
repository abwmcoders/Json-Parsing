import 'package:dio/dio.dart';

class GeneralServiceNetwork {
  late Dio _dio;
  final baseUrl = "https://newsapi.org/v2/";

  GeneralServiceNetwork() {
    _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
        ));

    initializeInterceptors();

  }

  Future<Response> getRequest(String endPoint) async {
    Response response;

    try {
      response = await _dio.get(endPoint);
    } on DioError catch (e) {
      print(e);
      throw Exception(e.message);
    }
    return response;

  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (error, handler) {
        print(error.message);
        return handler.next(error);
  },

  onRequest: (request, handler) {
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