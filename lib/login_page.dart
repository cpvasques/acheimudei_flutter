import 'package:flutter/material.dart';
import 'package:achei_mudei/widgets/botaoGoogle.dart';
import 'package:achei_mudei/widgets/botaoFacebook.dart';
import 'package:achei_mudei/widgets/loginForm.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("ACHEI MUDEI"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // add this
            children: <Widget>[
              Container(
                child: LoginForm(),
              ),
              Container(
                margin: EdgeInsets.only(top: 35, bottom: 5, left: 10, right: 10),
                child: GoogleBuilder(),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 5, bottom: 10, left: 10, right: 10),
                child: FacebookBuilder(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
