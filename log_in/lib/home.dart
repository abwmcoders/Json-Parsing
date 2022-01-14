import 'package:flutter/material.dart';
import 'package:log_in/model/user_model.dart';

class HomeScreen extends StatefulWidget {
  final UserModel user;
  const HomeScreen({Key? key, required this.user}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.user.email),
            Text(widget.user.token),
          ],
        ),
      ),
    );
  }
}
