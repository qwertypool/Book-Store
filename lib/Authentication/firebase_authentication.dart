import 'package:book_store/Screens/Home/mainPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthClass {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void>? signInWithEmail(
      {required String email,
      required String password,
      required String confirmPassword,
      required BuildContext context}) async {
    if (password == confirmPassword) {
      try {
        await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
        );
      } catch (e) {
        showSnackBar(context, e.toString());
      }
    } else {
      showSnackBar(context, "Passowrd did'nt matched");
    }
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
