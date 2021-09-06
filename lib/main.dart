import 'package:book_store/routes.dart';
import 'package:book_store/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Screens/Home/mainPage.dart';
import 'Screens/PersonalDetails/GetData.dart';
import 'Screens/PersonalDetails/testScreen.dart';
import 'Screens/Registration/verifyEmail.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Store',
      theme: theme(),
      // home: AddUser("ok", "ok", 123),
      // home: UserInformation(),
      home: MainPage(),
      //home: AddUser(),
      // initialRoute: SplashScreen.routeName,
      // routes: routes,
    );
  }
}
