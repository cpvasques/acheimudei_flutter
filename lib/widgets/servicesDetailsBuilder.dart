import 'package:flutter/material.dart';

class ServicesDetails extends StatefulWidget {

  int index;
  ServicesDetails({this.index});

  @override
  _ServicesDetails createState() => _ServicesDetails(index);
}

class _ServicesDetails extends State<ServicesDetails> {

  int index;
  _ServicesDetails(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SERVIÇOS"), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(children: [
          serviceType(index),
        ]),
      ),
    );
  }
}

Widget serviceType(int index) {
  switch (index){
    case 1:
      return form();
      break;

    default:
      return form();
      break;
  }
}

Widget form(){

  final textboxController = TextEditingController();
  final phoneController = TextEditingController();
  final serviceController = TextEditingController();

  String textbox;
  String phone;
  String service;

  void _textboxChanged(String text){
    textbox = text;
  }

  void _phoneChanged(String text){
    phone = text;
  }

  void _serviceChanged(String text){
    service = text;
  }

  return Container(
    child: Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Text('Precisa dos nossos serviços?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xfffe7400),
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ))),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: buildTextField("Tipo de Serviço", serviceController, _serviceChanged, 1),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: buildTextField("Celular", phoneController, _phoneChanged, 1),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: buildTextField("Assunto", textboxController, _textboxChanged, 3),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: ButtonTheme(
                  minWidth: double.infinity,
                  child: MaterialButton(
                    height: 55.0,
                    child: Text(
                      'ENVIAR',
                      style: new TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    color: Color(0xfffe7400),
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


Widget buildTextField(String label, TextEditingController controller, Function func, int line){
  return TextField(
        maxLines: line,
        controller: controller,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: Color(0xfffe7400)),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue)
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xfffe7400),)
            )
        ),
        style: TextStyle(
            color: Color(0xfffe7400), fontSize: 25.0
        ),
        onChanged: func
    );
}


