import 'package:dio/dio.dart';
import 'package:mvvm_and_api/model/article_model.dart';
import 'package:mvvm_and_api/utils/constants.dart';

class  ApiServices {
  var dio = Dio();

  // for top headline
  Future<List<ModelViewArticle>> getTopHeadlines() async {
    final response = await dio.get(Constants.topHeadlines);
    if(response.statusCode == 200) {
      final result = response.data;
      Iterable list = result["articles"];
      return list.map((article) => ModelViewArticle.fromJson(article)).toList();
    }
    else{
      throw Exception("response Failed");
    }
  }


  //

   Future<List<ModelViewArticle>> getNewsByCountry(String country) async {
    final response = await dio.get(Constants.headLinesFor(country));
    if(response.statusCode == 200) {
      final result = response.data;
      Iterable list = result["articles"];
      return list.map((article) => ModelViewArticle.fromJson(article)).toList();
    }
    else{
      throw Exception("response Failed");
    }
  }
}