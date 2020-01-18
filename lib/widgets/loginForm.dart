import 'package:flutter/material.dart';
import 'package:achei_mudei/widgets/googleButton.dart';
import 'package:achei_mudei/widgets/facebookButton.dart';
import 'package:achei_mudei/pages/Home.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginForm createState() => _LoginForm();
}

class _LoginForm extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return form(context);
  }
}

Widget form(BuildContext context) {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  String email;
  String pass;

  void _emailChanged(String text) {
    email = text;
  }

  void _passChanged(String text) {
    pass = text;
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
                          "Senha", passController, _passChanged, 1),
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
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) => HomePage(name: 'Caue Pievetti Vasques', email: 'email@email.com', imageUrl: 'https://avatars1.githubusercontent.com/u/37748172?s=460&v=4', login: 'entrar')));
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
    Function func, int lines) {
  return TextField(
      maxLines: lines,
      controller: controller,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Color(0xfffe7400)),
          border: OutlineInputBorder(),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xfffe7400),
          ))),
      style: TextStyle(color: Color(0xfffe7400), fontSize: 20.0),
      onChanged: func);
}
