import 'dart:async';
import 'package:book_store/Screens/Registration/signUp.dart';
import 'package:flutter/material.dart';
import 'Screens/Registration/login.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
        () => Navigator.pushNamed(context, SignUpScreen.routeName));

    // Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(builder: (BuildContext context) => SignUp())));
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
