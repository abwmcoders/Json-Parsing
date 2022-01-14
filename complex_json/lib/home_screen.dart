import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'general_service_network/general_servive_network.dart';
import 'models/tesla_articles_model.dart';
import 'models/tesla_news_model.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;
  late GeneralServiceNetwork _network;
  late TeslaNews _teslaNews;
  late List<ArticleClass> _articles;

  Future getLatestNews() async {
    Response response;
    try {
      _isLoading = true;
      response = await _network.getRequest(
          "/top-headlines?sources=techcrunch&apiKey=b68e68a90afd4125a8edba60c536822c");
      _isLoading = false;
      if (response.statusCode == 200) {
        setState(() {
          _teslaNews = TeslaNews.fromJson(response.data);
          _articles = _teslaNews.articleClass;
        });
      } else {
        print("Error getting news ${response.statusCode}");
      }
    } on DioError catch (e) {
      _isLoading = false;
      print(e);
    }
  }

  @override
  void initState() {
    _network = GeneralServiceNetwork();
    getLatestNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // context.read<NewsProvider>().getLatestNews();
    // Provider.of<NewsProvider>(context, listen: false).getLatestNews();
    return Scaffold(
      appBar: AppBar(),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : _articles != null
                ? ListView.builder(
                    itemCount: _articles.length,
                    itemBuilder: (context, index) {
                      var news = _articles[index];
                      return Card(
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(news.urlToImage),
                              const SizedBox(height: 10),
                              Text(
                                news.title,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.amber.shade900,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                news.content,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    })
                : const Center(
                    child: Text("Error getting news"),
                  ),
      ),
    );
  }
}
