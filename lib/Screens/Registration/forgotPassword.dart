import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  static String routeName = '/forgotPasswordRoute';
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Forgot Password')),
    );
  }
}
