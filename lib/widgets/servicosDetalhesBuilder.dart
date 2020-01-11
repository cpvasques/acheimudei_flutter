import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ServicosDetalhesBuilder extends StatefulWidget {

  int index;
  ServicosDetalhesBuilder({this.index});

  @override
  _ServicosDetalhesBuilder createState() => _ServicosDetalhesBuilder(index);
}

class _ServicosDetalhesBuilder extends State<ServicosDetalhesBuilder> {

  int index;
  _ServicosDetalhesBuilder(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SERVIÇOS"), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(children: [
          tipoServico(index),
        ]),
      ),
    );
  }
}

Widget tipoServico(int index) {
  switch (index){
    case 1:
      return formulario();
      break;

    default:
      return formulario();
      break;
  }
}

Widget formulario(){

  final assuntoController = TextEditingController();
  final celularController = TextEditingController();
  final servicoController = TextEditingController();

  String assunto;
  String celular;
  String servico;

  void _assuntoChanged(String text){
    assunto = text;
  }

  void _celularChanged(String text){
    assunto = text;
  }

  void _tipoServicoChanged(String text){
    assunto = text;
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
                child: buildTextField("Tipo de Serviço", servicoController, _assuntoChanged, 1),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: buildTextField("Celular", celularController, _assuntoChanged, 1),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: buildTextField("Assunto", assuntoController, _assuntoChanged, 3),
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


Widget buildTextField(String label, TextEditingController controller, Function funcao, int linha){
  return TextField(
        maxLines: linha,
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
        onChanged: funcao
    );
}


