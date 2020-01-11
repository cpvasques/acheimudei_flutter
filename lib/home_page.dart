import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:achei_mudei/widgets/servicosBuilder.dart';
import 'package:achei_mudei/widgets/anunciarImovelBuilder.dart';
import 'package:achei_mudei/widgets/anunciosBuilder.dart';
import 'package:achei_mudei/widgets/menuLateralBuilder.dart';
import 'package:achei_mudei/second_page.dart';

class HomePage extends StatefulWidget {
  String name;
  String email;
  String imageUrl;

  HomePage({this.name, this.email, this.imageUrl});

  @override
  _HomePage createState() => _HomePage(name, email, imageUrl);
}

class _HomePage extends State<HomePage> {
  int currentPage = 0;
  String name;
  String email;
  String imageUrl;

  _HomePage(this.name, this.email, this.imageUrl);

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
          child: trocarPagina(currentPage),
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
      drawer: MenuLateralBuilder(name: name, email: email, imageUrl: imageUrl),
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
