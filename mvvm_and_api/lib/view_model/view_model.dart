import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:mvvm_and_api/model/article_model.dart';

class ViewModel{
 ModelViewArticle _modelViewArticle;
  ViewModel({required ModelViewArticle article}) : _modelViewArticle = article;

  String get title{
    return _modelViewArticle.title;
  }

  String get publishedAt{
    final dateTime = DateFormat("yyyy-mm-ddTHH:mm:ssZ").parse(_modelViewArticle.publishAt);
    return DateFormat.yMMMMEEEEd("en-us").format(dateTime);
  }


  String get description{
    return _modelViewArticle.description;
  }


  String get url{
    return _modelViewArticle.url;
  }


  String get urlToImage{
    return _modelViewArticle.urlToImage;
  }
}
