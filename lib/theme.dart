import 'package:flutter/material.dart';
import 'constantParameters.dart';

ThemeData theme() {
  return ThemeData(
    primarySwatch: Colors.orange,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme(),
    fontFamily: 'Ubuntu',
    textTheme: textTheme(),
   // inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}


TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline6: TextStyle(
        // color: Color(0XFF8B8B8B),
        color:kPrimaryColor,
        fontSize: 24
        ),
    ),
  );
}
