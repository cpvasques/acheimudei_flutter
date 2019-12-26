import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:teste_funcando/widgets/servicosBuilder.dart';
import 'package:teste_funcando/widgets/anunciarImovelBuilder.dart';
import 'package:teste_funcando/widgets/anunciosBuilder.dart';
import 'package:teste_funcando/widgets/menuLateralBuilder.dart';
import 'package:teste_funcando/second_page.dart';


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
  int currentPage = 0;

  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ACHEI MUDEI"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: trocarPagina(currentPage),
        ),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        circleColor: Colors.orangeAccent,
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
      drawer: MenuLateralBuilder(),
    );
  }

  Widget pagina(String titulo) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(titulo),
        RaisedButton(
          child: Text(
            "Abrir nova página",
            style: TextStyle(color: Colors.white),
          ),
          color: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SecondPage()));
          },
        )
      ],
    );
  }

  trocarPagina(int page) {
    switch (page) {
      case 0:
        return AnunciosBuilder();
      case 1:
        return AnunciarImovelBuilder();
      case 2:
        return ServicosBuilder();
      case 3:
        return pagina('Pagina 3');
      default:
        return AnunciosBuilder();
    }
  }
}
