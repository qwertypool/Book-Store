import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/SignUpScreen";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("SignUpScreen")),
    );
  }
}
