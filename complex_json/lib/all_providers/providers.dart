

import 'package:complex_json/general_service_network/general_servive_network.dart';
import 'package:complex_json/models/tesla_articles_model.dart';
import 'package:complex_json/models/tesla_news_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NewsProvider extends ChangeNotifier {
  bool _isLoading = false;
  late GeneralServiceNetwork _network;
  late TeslaNews _teslaNews;
  late List<ArticleClass> _articles;

  bool get isLoading => _isLoading;
  GeneralServiceNetwork get network => _network;
  TeslaNews get teslaNews => _teslaNews;
  List<ArticleClass> get articles => _articles;


  Future getLatestNews() async {
    Response response;
    try {
      _isLoading = true;
      response = await _network.getRequest("/everything?q=tesla&from=2021-11-30&sortBy=publishedAt&apiKey=b68e68a90afd4125a8edba60c536822c");
      _isLoading = false;
      if(response.statusCode == 200) {
        _teslaNews = TeslaNews.fromJson(response.data);
        _articles = _teslaNews.articleClass;
      }else{
        print("Error getting news ${response.statusCode}");
      }
    } on DioError catch (e) {
      _isLoading = false;
      print(e);
    }
    notifyListeners();
  }
}