import 'package:book_store/Screens/Home/mainPage.dart';
import 'package:book_store/routes.dart';
import 'package:book_store/splashScreen.dart';
import 'package:flutter/material.dart';

import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Store',
      theme: theme(),
      initialRoute: SplashScreen.routeName,
      //initialRoute: MainPage.routeName,
      routes: routes,
    );
  }
}
