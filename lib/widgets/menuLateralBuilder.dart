import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teste_funcando/controllers/sign_in_google.dart';
import 'dart:io';
import 'dart:io' show Platform;

class MenuLateralBuilder extends StatefulWidget {
  String name;
  String email;
  String imageUrl;

  MenuLateralBuilder({this.name, this.email, this.imageUrl});

  @override
  _MenuLateralBuilder createState() => _MenuLateralBuilder(name, email, imageUrl);
}

class _MenuLateralBuilder extends State<MenuLateralBuilder> {
  String name;
  String email;
  String imageUrl;

  _MenuLateralBuilder(this.name, this.email, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return menuLogado(context, name, email, imageUrl);
  }
}

menuLogado(BuildContext context, name, email, imageUrl){
  return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 250.0,
            child: DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CircleAvatar(
                    radius: 92.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(imageUrl),
                      maxRadius: 88.0,
                    ),
                  ),
                  Text(
                    name,
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.storage, size: 21),
                Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'Meus Anúncios',
                      style: TextStyle(fontSize: 16),
                    ))
              ],
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.settings, size: 21),
                Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'Configurações',
                      style: TextStyle(fontSize: 16),
                    ))
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.exit_to_app, size: 21),
                Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'Sair',
                      style: TextStyle(fontSize: 16),
                    ))
              ],
            ),
            onTap: () {
              showAlertDialog(context);
            },
          ),
        ],
      ),
    );
}

showAlertDialog(BuildContext context) {
  Widget cancelaButton = FlatButton(
    child: Text("Cancelar"),
    onPressed:  () {Navigator.of(context).pop();},
  );
  Widget continuaButton = FlatButton(
    child: Text("Sair"),
    onPressed:  () {
      signOutGoogle(context);

      if (Platform.isAndroid) {
        SystemNavigator.pop();
      } else if (Platform.isIOS) {
        exit(0);
      }
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("Achei Mudei"),
    content: Text("Deseja sair do aplicativo ?"),
    actions: [
      cancelaButton,
      continuaButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}