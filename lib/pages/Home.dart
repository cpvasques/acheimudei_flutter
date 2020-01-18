import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:achei_mudei/pages/Services.dart';
import 'package:achei_mudei/widgets/newAnnounce.dart';
import 'package:achei_mudei/widgets/announceBuilder.dart';
import 'package:achei_mudei/widgets/sidebarBuilder.dart';
import 'package:achei_mudei/pages/Chat.dart';

class HomePage extends StatefulWidget {
  String name;
  String email;
  String imageUrl;
  String login;

  HomePage({this.name, this.email, this.imageUrl, this.login});

  @override
  _HomePage createState() => _HomePage(name, email, imageUrl, login);
}

class _HomePage extends State<HomePage> {
  int currentPage = 0;
  String name;
  String email;
  String imageUrl;
  String login;

  _HomePage(this.name, this.email, this.imageUrl, this.login);

  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ACHEI MUDEI"),
        centerTitle: true,
        backgroundColor: Color(0xfffe7400),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: changePage(currentPage),
        ),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        circleColor: Color(0xfffe7400),
        tabs: [
          TabData(iconData: Icons.home, title: "Home"),
          TabData(iconData: Icons.monetization_on, title: "Anunciar"),
          TabData(iconData: Icons.assignment, title: "Serviços"),
          TabData(iconData: Icons.chat_bubble_outline, title: "Chat"),
        ],
        initialSelection: 0,
        key: bottomNavigationKey,
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
      drawer: Sidebar(name: name, email: email, imageUrl: imageUrl, login: login),
    );
  }

  changePage(int page) {
    switch (page) {
      case 0:
        return AnnounceBuilder();
      case 1:
        return NewAnnounce();
      case 2:
        return ServicesBuilder();
      case 3:
        return Chat();
      default:
        return AnnounceBuilder();
    }
  }
}
