import 'package:flutter/material.dart';
import 'package:teste_funcando/home_page.dart';
import 'package:teste_funcando/login_page.dart';


void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
   @override
  Widget build(BuildContext context) {
    //return HomePage();
     return LoginPage();
  }

}
