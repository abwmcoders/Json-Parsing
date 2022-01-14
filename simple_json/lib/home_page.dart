import 'package:flutter/material.dart';
import 'package:simple_json/dio_netwok_client.dart';
import 'package:simple_json/user_model.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({ Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DioNetworkClient _client = DioNetworkClient();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(fontFamily: 'Pushster'),),
      ),
      body: Center(
        child: FutureBuilder<UserDetails?>(
          future: _client.getUser("7"),
          builder: (context, snapshot){
            if(snapshot.hasData){
              UserDetails? userInfo = snapshot.data;
              if(userInfo != null) {
                Data data = userInfo.data;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(data.avatar),
                    const SizedBox(height: 15),
                    Text("Firstname: ${data.firstName}"),
                    Text("Lastname: ${data.lastName}"),
                    Text("Email address: ${data.email}"),
                    Text("Id Number: ${data.id}"),
                  ],
                );
              }
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}