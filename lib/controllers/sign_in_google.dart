import 'package:flutter/material.dart';
import 'package:achei_mudei/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:achei_mudei/home_page.dart';

String name;
String email;
String imageUrl;

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<String> signInWithGoogle(BuildContext context) async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  assert(user.email != null);
  assert(user.displayName != null);
  assert(user.photoUrl != null);

  String name = user.displayName;
  String email = user.email;
  String imageUrl = user.photoUrl;

  if (name.contains(" ")) {
   name = name.substring(0, name.indexOf(" "));
  }

  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => HomePage(name: name, email: email, imageUrl: imageUrl, login: 'google')));

  return 'signInWithGoogle succeeded: $user';
}

void signOutGoogle(BuildContext context) async{
  await googleSignIn.signOut();
}