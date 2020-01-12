import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:achei_mudei/home_page.dart';
import 'package:http/http.dart' as http;

final FirebaseAuth _auth = FirebaseAuth.instance;
final FacebookLogin fbLogin = new FacebookLogin();
bool isFacebookLoginIn = false;
String errorMessage = '';
String successMessage = '';

Future<FirebaseUser> signInWithFacebook(BuildContext context) async {
  FirebaseUser currentUser;
  //fbLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
  // if you remove above comment then facebook login will take username and pasword for login in Webview
  try {
    final FacebookLoginResult facebookLoginResult =
        await fbLogin.logInWithReadPermissions(['email', 'public_profile']);
    if (facebookLoginResult.status == FacebookLoginStatus.loggedIn) {
      FacebookAccessToken facebookAccessToken = facebookLoginResult.accessToken;
      var graphResponse = await http.get(
          'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${facebookAccessToken.token}');
      var profile = json.decode(graphResponse.body);
      print(profile);

      final AuthCredential credential = FacebookAuthProvider.getCredential(
          accessToken: facebookAccessToken.token);

      final AuthResult authResult = await _auth.signInWithCredential(credential);
      final FirebaseUser user = authResult.user;

      assert(user.email != null);
      assert(user.displayName != null);
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);
      currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomePage(name: profile['name'], email: profile['email'], imageUrl: 'https://graph.facebook.com/v3.1/'+profile['id']+'/picture', login: 'facebook')));
      return currentUser;
    }
  } catch (e) {
    print(e);
  }

  return currentUser;
}

Future<bool> facebookLoginout() async {
  await _auth.signOut();
  await fbLogin.logOut();
  print('deslogou');
  return true;
}
