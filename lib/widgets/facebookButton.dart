import 'package:flutter/material.dart';
import 'package:achei_mudei/controllers/sign_in_facebook.dart';

class FacebookBuilder extends StatefulWidget {
  @override
  _FacebookBuilder createState() => _FacebookBuilder();
}

class _FacebookBuilder extends State<FacebookBuilder> {

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        signInWithFacebook(context);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("images/facebook.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Entrar com o Facebook',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff4267B2),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


