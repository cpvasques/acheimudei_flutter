import 'package:flutter/material.dart';
import 'package:achei_mudei/pages/AnnounceDetails.dart';

class AnunciosBuilder extends StatefulWidget {
  @override
  _AnunciosBuilder createState() => _AnunciosBuilder();
}

class _AnunciosBuilder extends State<AnunciosBuilder> {
  @override
  Widget build(BuildContext context) {
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
}