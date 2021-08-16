import 'dart:async';
import 'package:book_store/Screens/Home/mainPage.dart';
import 'package:book_store/Screens/Registration/signUp.dart';
import 'package:flutter/material.dart';
import 'Authentication/firebase_authentication.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthClass authClass = AuthClass();
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  checkLogin() async {
    String? token = await authClass.getToken();
    if (token != null)
      Timer(Duration(seconds: 2),
          () => Navigator.pushNamed(context, MainPage.routeName));
    else
      Timer(Duration(seconds: 2),
          () => Navigator.pushNamed(context, SignUpScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Container(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.jpg',
                  fit: BoxFit.cover,
                ),
                Center(
                    child: Text(
                  'Jeeva Puthakalayam',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      letterSpacing: 1.5,
                      fontFamily: 'Ubuntu'),
                )),
              ],
            ),
          ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
