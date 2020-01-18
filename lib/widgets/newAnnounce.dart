import 'package:flutter/material.dart';

class NewAnnounce extends StatefulWidget {
  @override
  _NewAnnounce createState() => _NewAnnounce();
}

class _NewAnnounce extends State<NewAnnounce> {
  @override
  Widget build(BuildContext context) {
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
                          color: Color(0xfffe7400),
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
                      color: Colors.blue,
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
}