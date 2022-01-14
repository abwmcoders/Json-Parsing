import 'package:flutter/cupertino.dart';
import 'package:mvvm_and_api/model/article_model.dart';
import 'package:mvvm_and_api/view_model/view_model.dart';

enum LoadingStatus{
  completed,
  searching,
  empty,
}

class ListViewModel with ChangeNotifier{
  LoadingStatus loadingStatus = LoadingStatus.empty;

  List<ViewModel> articles = <ViewModel>[];

  // method to fetch news

  void getTopNewsHeadlines() async {

    List<ModelViewArticle> _newsArticle = await we().;
    loadingStatus = LoadingStatus.searching;
    notifyListeners();
    this.articles = _newsArticle.map((article) => ViewModel(article: article)).toList();

    if(this.articles.isEmpty){
      loadingStatus = LoadingStatus.empty;
    }
    else{
      loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();
  }

  // method to get individual news


  void getTopNewsHeadlines() async {

    List<ModelViewArticle> _newsArticle = <ModelViewArticle>[];
    loadingStatus = LoadingStatus.searching;
    notifyListeners();
    this.articles = _newsArticle.map((article) => ViewModel(article: article)).toList();

    if(this.articles.isEmpty){
      loadingStatus = LoadingStatus.empty;
    }
    else{
      loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();
  }
}