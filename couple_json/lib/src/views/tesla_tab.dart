import 'package:couple_json/src/models/article_model.dart';
import 'package:couple_json/src/models/headline_model.dart';
import 'package:couple_json/src/services/general_network_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class TeslaTab extends StatefulWidget {
  const TeslaTab({ Key? key }) : super(key: key);

  @override
  _TeslaTabState createState() => _TeslaTabState();
}

class _TeslaTabState extends State<TeslaTab> {

  bool isLoading = false;
  late GeneralNetworkService _networkService;
  late Headline _headline;
  late List<Article> _newsArticle;

  Future getNews() async {
    Response response;
    try {
      isLoading = true;
      response = await _networkService.getRequest("/top-headlines?country=us&apiKey=b68e68a90afd4125a8edba60c536822c");
      isLoading = false;
      if(response.statusCode == 200) {
        setState(() {
          _headline = Headline.fromJson(response.data);
          _newsArticle = _headline.articles;
        });
      } else{
        print("Error getting news: ${response.statusCode}");
      }
    } on DioError catch (e) {
      isLoading = false;
      print(e);
        }

  }

  @override
  void initState() {
    _networkService = GeneralNetworkService();
    getNews();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading ? const Center(
        child: CircularProgressIndicator(),
        ) : _newsArticle != null ? ListView.builder(
          itemCount: _newsArticle.length,
        itemBuilder: (context,index) {
          final news = _newsArticle[index];
          return Container(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(news.urlToImage), fit: BoxFit.contain)
                ),
              ),
              Text(news.title, style: TextStyle(
                fontSize: 22,
                wordSpacing: .25,
                decorationThickness: 3.5,
                // overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent.shade700,
              ),
              ),
              const SizedBox(height: 12),
              Text(news.description, style: const TextStyle(
                fontSize: 15,
                wordSpacing: .25,
                decorationThickness: 1.5,
                // overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(news.publishedAt,style: const TextStyle(
                fontSize: 17,
                wordSpacing: .25,
                decorationThickness: 4.5,
                // overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.link, size: 40, color: Colors.blueGrey,))
                ],
              )
            ],
          ),
        );
      }) : const Center(child: Text("Unable to get news"),),
    );
  }
}