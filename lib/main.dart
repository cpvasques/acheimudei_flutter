import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste_funcando/second_page.dart';
import 'package:teste_funcando/detalhe_anuncio.dart';

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
      drawer: menuLateral(),
    );
  }

  Widget menuLateral() {
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
                Icon(Icons.edit, size: 23),
                Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'Editar Perfil',
                      style: TextStyle(fontSize: 18),
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
                Icon(Icons.storage, size: 23),
                Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'Meus Anúncios',
                      style: TextStyle(fontSize: 18),
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
                Icon(Icons.settings, size: 23),
                Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'Configurações',
                      style: TextStyle(fontSize: 18),
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
                Icon(Icons.exit_to_app, size: 23),
                Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'Sair',
                      style: TextStyle(fontSize: 18),
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
        ],
      ),
    );
  }

  Widget anunciosBuilder() {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(8.0),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => DetalheAnuncio()));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                    child: Image.network(
                        'https://odis.homeaway.com/odis/listing/a5e6710d-5ec3-45bc-8b80-b1886a3a7089.c10.jpg',
                        // width: 300,
                        height: 250,
                        fit: BoxFit.fill),
                  ),
                  ListTile(
                      title: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text('Casa Maravilhosa!',
                              style: TextStyle(fontSize: 18))),
                      subtitle: Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                            'Casa maravilhosa localizada no Parque dos Pássaros!! 5 quartos, 3 suítes, churrasqueira, piscina e muito mais!',
                            style: TextStyle(fontSize: 16)),
                      )),
                  Padding(
                      padding: EdgeInsets.all(16),
                      child: MaterialButton(
                        height: 45.0,
                        child: Text(
                          'DETALHES',
                          style: new TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetalheAnuncio()));
                        },
                      ))
                ],
              ),
            ),
          ),
        ),
      ],
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

  Widget venderImovel() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/comprar2.png"), fit: BoxFit.scaleDown),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 100),
                    child: Text('Deseja vender seu imóvel?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.orangeAccent,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        ))),
                Container(
                  margin: EdgeInsets.only(top: 200),
                  child: ButtonTheme(
                    minWidth: double.infinity,
                    child: MaterialButton(
                      height: 55.0,
                      child: Text(
                        'ANUNCIAR',
                        style: new TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.orangeAccent,
                      onPressed: () {
                        print('anuncio');
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget servicos() {
    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverGrid.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              servicosMaterial('Escritório de Advocacia'),
              servicosMaterial('Documentista Imobiliário'),
              servicosMaterial('Elaboração de Contrato'),
            ],
          ),
        ),
      ],
    );
  }

  Widget servicosMaterial(String label) {
    return Material(
      color: Colors.blue,
      child: InkWell(
        onTap: () => print("Container pressed"), // handle your onTap here
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.gavel, size: 25, color: Colors.white),
              Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
            ],
          ),
        ),
      ),
    );
  }

  trocarPagina(int page) {
    switch (page) {
      case 0:
        return anunciosBuilder();
      case 1:
        return venderImovel();
      case 2:
        return servicos();
      case 3:
        return pagina('Pagina 3');
      default:
        return anunciosBuilder();
    }
  }
}
