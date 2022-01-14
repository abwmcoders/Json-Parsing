import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:self_json/src/views/home_view/home_view.dart';

void main() async {
  runApp(const MyApp());
  var dio = Dio();
  String url = "https://newsapi.org/v2/everything?q=apple&from=2021-12-21&to=2021-12-21&sortBy=popularity&apiKey=b68e68a90afd4125a8edba60c536822c";
  final response = await dio.get(url);
  // ignore: avoid_print
  // print(response.data.toString());
  print(response.data);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const HomeScreen(),
    );
  }
}
