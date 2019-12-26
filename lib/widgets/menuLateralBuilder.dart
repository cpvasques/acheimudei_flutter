import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:io' show Platform;

class MenuLateralBuilder extends StatefulWidget {
  @override
  _MenuLateralBuilder createState() => _MenuLateralBuilder();
}

class _MenuLateralBuilder extends State<MenuLateralBuilder> {
  @override
  Widget build(BuildContext context) {
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
                      backgroundImage: NetworkImage(
                          "https://www.dhresource.com/0x0/f2/albu/g8/M01/DC/89/rBVaV1wN2rqAE5GDAAHlA_NOGoc884.jpg"),
                      maxRadius: 88.0,
                    ),
                  ),
                  Text(
                    "Caue Pievetti Vasques",
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
}

showAlertDialog(BuildContext context) {
  Widget cancelaButton = FlatButton(
    child: Text("Cancelar"),
    onPressed:  () {Navigator.of(context).pop();},
  );
  Widget continuaButton = FlatButton(
    child: Text("Sair"),
    onPressed:  () {
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