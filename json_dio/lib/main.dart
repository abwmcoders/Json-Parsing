import 'package:flutter/material.dart';
import 'package:json_dio/src/views/single_user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Single User',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SingleUserScreen(title: 'Single User'),
    );
  }
}
