import 'package:book_store/Screens/Home/mainPage.dart';
import 'package:book_store/Screens/Registration/forgotPassword.dart';
import 'package:book_store/Screens/Registration/verifyEmail.dart';
import 'package:flutter/widgets.dart';
import 'package:book_store/splashScreen.dart';
import 'Screens/Registration/login.dart';
import 'Screens/Registration/signUp.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName : (context) => SplashScreen(),
  LoginScreen.routeName  : (context) => LoginScreen(),
  SignUpScreen.routeName : (context) => SignUpScreen(),
  ForgotPassword.routeName : (context) => ForgotPassword(),
  MainPage.routeName : (context) => MainPage(),
  VerifyEmail.routeName : (context) => VerifyEmail(),
};

