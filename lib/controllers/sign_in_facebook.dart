import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:achei_mudei/controllers/sign_in_facebook.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:achei_mudei/home_page.dart';

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

      print('user');
      print(user);
      print('currentUser');
      print(currentUser);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomePage(name: 'name', email: 'email', imageUrl: 'imageUrl', login: 'facebook')));
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
