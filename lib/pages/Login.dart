import 'package:flutter/material.dart';
import 'package:achei_mudei/widgets/googleButton.dart';
import 'package:achei_mudei/widgets/facebookButton.dart';
import 'package:achei_mudei/widgets/loginForm.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       /* appBar: AppBar(
          title: Text("teste"),
          centerTitle: true,
          backgroundColor: Color(0xfffe7400),
        ),*/
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("images/background.png"), fit: BoxFit.cover),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, // add this
              children: <Widget>[
                Container(
                  child: LoginForm(),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
