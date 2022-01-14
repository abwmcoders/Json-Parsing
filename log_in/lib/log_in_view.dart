import 'package:flutter/material.dart';
import 'package:log_in/home.dart';
import 'package:log_in/log_in_interface.dart';
import 'package:log_in/login_services.dart';
import 'package:log_in/model/user_model.dart';

class LogInView extends StatefulWidget {
  const LogInView({Key? key}) : super(key: key);

  @override
  _LogInViewState createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  final ILogin _iLoginServices = LogInServices();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.assistant_direction)),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "E-mail",
                  ),
                  textInputAction: TextInputAction.next,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: "E-mail",
                  ),
                  textInputAction: TextInputAction.done,
                  onEditingComplete: () async {
                    UserModel user = await _iLoginServices.login(_emailController.text, _passwordController.text);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(user: user)));
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
