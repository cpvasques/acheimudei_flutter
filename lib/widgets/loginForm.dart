import 'package:flutter/material.dart';
import 'package:achei_mudei/widgets/botaoGoogle.dart';
import 'package:achei_mudei/widgets/botaoFacebook.dart';

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

Widget formulario() {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  String email;
  String senha;

  void _emailChanged(String text) {
    email = text;
  }

  void _senhaChanged(String text) {
    senha = text;
  }

  return Container(
    child: Center(
      child: Padding(
        padding: EdgeInsets.all(6.0),
        child: Container(
            margin: EdgeInsets.only(top: 25),
            decoration: new BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    blurRadius: 20.0, // soften the shadow
                    spreadRadius: 2.0, //extend the shadow
                    offset: Offset(
                      5.0, // Move to right 10  horizontally
                      5.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],),
          child: Card(
            child: Column(
              children: <Widget>[
                Image.asset('images/logo_am2.png'),
                Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Padding(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      child: buildTextField(
                          "Email", emailController, _emailChanged, 1),
                    )),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Padding(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      child: buildTextField(
                          "Senha", senhaController, _senhaChanged, 1),
                    )),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Padding(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      child: ButtonTheme(
                        minWidth: double.infinity,
                        child: MaterialButton(
                          height: 55.0,
                          child: Text(
                            'ENTRAR',
                            style: new TextStyle(
                              fontSize: 20.0,
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
                    )),
                Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: Padding(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: GestureDetector(
                            child: Text(
                                "Ainda não possui uma conta? Clique aqui!",
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 16)),
                            onTap: () {
                              print('cadastrei');
                            }))),
                Container(
                    margin: EdgeInsets.only(top: 5, bottom: 10),
                    child: Padding(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: GestureDetector(
                            child: Text(
                                "Esqueci minha senha",
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 16)),
                            onTap: () {
                              print('esqueci');
                            }))),
                Container(
                  width: 335.0,
                  margin: EdgeInsets.only(top: 45),
                  child: GoogleBuilder(),
                  ),
                  Container(
                    width: 335.0,
                    margin: EdgeInsets.only(top: 15, bottom: 15),
                    child: FacebookBuilder(),
                  ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget buildTextField(String label, TextEditingController controller,
    Function funcao, int linha) {
  return TextField(
      maxLines: linha,
      controller: controller,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Color(0xffe17315)),
          border: OutlineInputBorder(),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xffe17315),
          ))),
      style: TextStyle(color: Color(0xffe17315), fontSize: 20.0),
      onChanged: funcao);
}
