import 'package:flutter/material.dart';
import 'package:achei_mudei/widgets/botaoGoogle.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginForm createState() => _LoginForm();
}

class _LoginForm extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return formulario();
  }
}

Widget formulario(){

  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  String email;
  String senha;

  void _emailChanged(String text){
    email = text;
  }

  void _senhaChanged(String text){
    senha = text;
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
                child: buildTextField("Email", emailController, _emailChanged, 1),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: buildTextField("Senha", senhaController, _senhaChanged, 1),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: ButtonTheme(
                  minWidth: double.infinity,
                  child: MaterialButton(
                    height: 55.0,
                    child: Text(
                      'ENTRAR',
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
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                child: GestureDetector(
                    child: Text("Ainda não possui uma conta? Clique aqui!", style: TextStyle(color: Colors.blue, fontSize: 18)),
                    onTap: () {print('cadastrei');}
                )
              ),
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
          labelStyle: TextStyle(color: Colors.orangeAccent),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue)
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orangeAccent,)
          )
      ),
      style: TextStyle(
          color: Colors.orangeAccent, fontSize: 25.0
      ),
      onChanged: funcao
  );
}




