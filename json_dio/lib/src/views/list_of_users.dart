import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:json_dio/src/models/list_users_response.dart';
import 'package:json_dio/src/models/single_user.dart';
import 'package:json_dio/src/services/general_network_service.dart';


class ListUsersScreen extends StatefulWidget {
  const ListUsersScreen({ Key? key }) : super(key: key);

  @override
  _ListUsersScreenState createState() => _ListUsersScreenState();
}

class _ListUsersScreenState extends State<ListUsersScreen> {

  late GeneralNetworkService _networkService;
  bool isLoading = false;
  late UsersList _usersList;
  late List<User> users;

  Future getUsersList() async {
    Response response;
    try{
      isLoading = true;
      response = await _networkService.getRequest("/api/users?page=2");
      isLoading = false;
      if(response.statusCode == 200){
        setState(() {
          _usersList = UsersList.fromJson(response.data);
          users = _usersList.usersList;
        });
      } else {
        print("Error getting users list statuscode: ${response.statusCode} ");
      }
    } on DioError catch(e){
      isLoading = false;
      print (e);
    }
  }


  @override
  void initState() {
    _networkService = GeneralNetworkService();
    getUsersList();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("List of users"),
      ),
      body: isLoading ? const Center(
        child: CircularProgressIndicator(),
      ) : users != null ? ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index){
          final lUser = users[index];
          return Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black12,offset: Offset(8, 0), blurRadius: 2, spreadRadius: .5,),
                               

              ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 1200,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: NetworkImage(lUser.avatar),fit: BoxFit.contain,),
                  ),
                ), 
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("First name: ${lUser.firstName}", style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.blueAccent, fontWeight: FontWeight.bold),),
                Text("Last name: ${lUser.lastName}", style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.blueAccent, fontWeight: FontWeight.bold),),
                Text("Email address:\n${lUser.email}", style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.blueAccent, fontWeight: FontWeight.bold),),
                  ],
                )
                
              ],
            )
            // ListTile(
            //   title: Text(lUser.firstName),
            //   subtitle: Text(lUser.email),
            //   leading: Image.network(lUser.avatar),
            // ),
          );
        },
      ) : Center(
        child: Text("Error getting list of user: ${users.hashCode}"),
      ),
    );
  }
}