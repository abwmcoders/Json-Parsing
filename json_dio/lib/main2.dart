import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:json_dio/src/views/list_of_users.dart';
import 'package:json_dio/src/views/single_user.dart';

void main() {
  runApp(const TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.person)),
                Tab(icon: Icon(Icons.people)),
              ],
            ),
            title: const Text('Tabs Demo'),
          ),
          body:  const TabBarView(
            children: [
             SingleUserScreen(title: "User",),
              ListUsersScreen()
            ],
          ),
        ),
      ),
    );
  }
}