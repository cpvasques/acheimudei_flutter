import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:achei_mudei/controllers/sign_in_google.dart';
import 'package:achei_mudei/controllers/sign_in_facebook.dart';
import 'dart:io';
import 'dart:io' show Platform;

class Sidebar extends StatefulWidget {
  String name;
  String email;
  String imageUrl;
  String login;

  Sidebar({this.name, this.email, this.imageUrl, this.login});

  @override
  _Sidebar createState() => _Sidebar(name, email, imageUrl, this.login);
}

class _Sidebar extends State<Sidebar> {
  String name;
  String email;
  String imageUrl;
  String login;

  _Sidebar(this.name, this.email, this.imageUrl, this.login);

  @override
  Widget build(BuildContext context) {
    return loggedIn(context, name, email, imageUrl, login);
  }
}

loggedIn(BuildContext context, name, email, imageUrl, login){
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
              showAlertDialog(context, login);
            },
          ),
        ],
      ),
    );
}

showAlertDialog(BuildContext context, String login) {
  Widget cancelButton = FlatButton(
    child: Text("Cancelar"),
    onPressed:  () {Navigator.of(context).pop();},
  );
  Widget okButton = FlatButton(
    child: Text("Sair"),
    onPressed:  () {
      print(login);
      if(login == 'facebook'){
        facebookLoginout();
      }else if(login == 'google'){
        signOutGoogle(context);
      }else{
        if (Platform.isAndroid) {
          SystemNavigator.pop();
        } else if (Platform.isIOS) {
          exit(0);
        }
      }

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
      cancelButton,
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}