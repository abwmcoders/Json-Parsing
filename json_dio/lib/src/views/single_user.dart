import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:json_dio/src/models/single_user.dart';
import 'package:json_dio/src/models/single_user_response.dart';
import 'package:json_dio/src/services/general_network_service.dart';

import 'list_of_users.dart';

class SingleUserScreen extends StatefulWidget {
  final String title;
  const SingleUserScreen({ Key? key, required this.title }) : super(key: key);

  @override
  State<SingleUserScreen> createState() => _SingleUserScreenState();
}

class _SingleUserScreenState extends State<SingleUserScreen> {

  late GeneralNetworkService networkService;
  late SingleUserResponse singleUserResponse;
  late User user;
  bool isLoading = false;

  Future getUser() async {
    Response response;
    try {
      isLoading = true;
      response = await networkService.getRequest('/api/users/5');
      isLoading = false;
      if (response.statusCode == 200) {
        setState(() {
          singleUserResponse = SingleUserResponse.fromJson(response.data);
          user = singleUserResponse.user;
        });
      }else {
        print("Failed to generate user statuscode: ${response.statusCode}");
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    networkService = GeneralNetworkService();
    getUser();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: isLoading ? const Center(
        child: CircularProgressIndicator(),
      ) : user != null ? SizedBox(
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(user.avatar),
              const SizedBox(height: 10,),
              Text("Full name: ${user.firstName} ${user.lastName}"),
              const SizedBox(height: 10,),
              Text("Email address: ${user.email}"),
              const SizedBox(height: 10,),
              Text("Identity number: PHD/TY/00${user.id}"),
              
              
              const SizedBox(height: 20),
              TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (contex) => const ListUsersScreen()));
                }, 
                child: const Text("List"),
              )
            ],
            ),
        ),
      ) : Center(
        child: Text("No user object found ${user.hashCode}"),
      ),
    );
  }
}