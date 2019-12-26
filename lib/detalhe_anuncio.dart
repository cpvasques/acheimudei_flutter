import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetalheAnuncio extends StatefulWidget {
  @override
  _DetalheAnuncio createState() => _DetalheAnuncio();
}

final List<String> imgList = [
  'https://odis.homeaway.com/odis/listing/a5e6710d-5ec3-45bc-8b80-b1886a3a7089.c10.jpg',
  'https://www.gazetadopovo.com.br/haus/wp-content/uploads/2019/05/09093032/casacor-2019-suite-master-ivan-wodzinski-1.jpg',
  'https://yata-apix-680f8be9-6ea4-4eb7-abd2-4ed2ae20ea9f.lss.locawebcorp.com.br/24a06b37504e450c80177937671f74e7.jpg',
  'https://i.pinimg.com/originals/2a/62/1a/2a621aeb16b0a05f8f52973731cd1389.jpg'
];

final Widget placeholder = Container(color: Colors.grey);

final List child = map<Widget>(
  imgList,
  (index, i) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(children: <Widget>[
          Image.network(
            i,
            fit: BoxFit.cover,
            width: 1000.0,
            height: 300,
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            ),
          ),
        ]),
      ),
    );
  },
).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class _DetalheAnuncio extends State<DetalheAnuncio> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DETALHES"), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(children: [
          CarouselSlider(
            items: child,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            pauseAutoPlayOnTouch: Duration(seconds: 3),
            height: 300,
            onPageChanged: (index) {
              setState(() {
                _current = index;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: map<Widget>(
              imgList,
              (index, url) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index
                          ? Color.fromRGBO(0, 0, 0, 0.9)
                          : Color.fromRGBO(0, 0, 0, 0.4)),
                );
              },
            ),
          ),
          valor(),
          descricao(),
          caracteristicas(),
        ]),
      ),
      bottomNavigationBar: btnAchei(),
    );
  }
}

Widget valor() {
  return Container(
    width: 500,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blue, width: 2),
      borderRadius: BorderRadius.all(
          Radius.circular(3.0) //                 <--- border radius here
          ),
    ),
    margin: EdgeInsets.only(left: 12.0, right: 12.0, top: 2.0, bottom: 4.0),
    child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(children: [
          Container(
            margin: EdgeInsets.only(right: 5),
            child: Icon(Icons.monetization_on,
                size: 25, color: Colors.orangeAccent),
          ),
          Text(
            "Valor:",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
              padding: EdgeInsets.all(5.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text(
                      "R\$ 1.200.000,00",
                      style: TextStyle(fontSize: 20),
                    ),
                  ))),
        ])),
  );
}

Widget descricao() {
  return Container(
    width: 500,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blue, width: 2),
      borderRadius: BorderRadius.all(
          Radius.circular(3.0) //                 <--- border radius here
          ),
    ),
    margin: EdgeInsets.only(left: 12.0, right: 12.0, top: 2.0, bottom: 4.0),
    child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 5),
                      child: Icon(Icons.format_align_left,
                          size: 25, color: Colors.orangeAccent),
                    ),
                    Text(
                      "Descrição:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        "Casa maravilhosa localizada no Parque dos Pássaros!! 5 quartos, 3 suítes, churrasqueira, piscina e muito mais!",
                        style: TextStyle(fontSize: 20),
                      ),
                    ))
              ],
            ),
          )
        ])),
  );
}

Widget caracteristicas() {
  return Container(
    width: 500,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blue, width: 2),
      borderRadius: BorderRadius.all(
          Radius.circular(3.0) //                 <--- border radius here
          ),
    ),
    margin: EdgeInsets.only(left: 12.0, right: 12.0, top: 2.0, bottom: 4.0),
    child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 5, bottom: 5),
                      child: Icon(Icons.local_hotel,
                          size: 25, color: Colors.orangeAccent),
                    ),
                    Text(
                      "Características:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 15, top: 5, bottom: 5),
                                  child: Text(
                                    "5",
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 15),
                                  child: Text(
                                    "Dorms",
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 15, top: 5, bottom: 5),
                                  child: Text(
                                    "3",
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 15),
                                  child: Text(
                                    "WC",
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 15, top: 5, bottom: 5),
                                  child: Text(
                                    "6",
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 15),
                                  child: Text(
                                    "Vagas",
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 15, top: 5, bottom: 5),
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 15),
                                  child: Text(
                                    "Cozinha",
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 15, top: 5, bottom: 5),
                                  child: Text(
                                    "352",
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 15),
                                  child: Text(
                                    "M²",
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                  ],
                )
              ],
            ),
          )
        ])),
  );
}

Widget btnAchei() {
  return Padding(
    padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 2.0, bottom: 4.0),
    child: MaterialButton(
        onPressed: () {},
        height: 45,
        color: Colors.orangeAccent,
        textColor: Colors.white,
        child: Text(
          'ACHEI !',
          style: new TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )),
  );
}
