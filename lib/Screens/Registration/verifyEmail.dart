import 'package:book_store/Components/defaultButton.dart';
import 'package:book_store/Screens/Registration/signUp.dart';
import 'package:book_store/Screens/Registration/verificationSuccessful.dart';
import 'package:flutter/material.dart';

import '../../constantParameters.dart';

class VerifyEmail extends StatefulWidget {
  static String routeName = '/verifyemailRoute';
  VerifyEmail({Key? key}) : super(key: key);

  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: defaultPadding * 4,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/message.png',
                      // fit: BoxFit.contain,
                      width: 140,
                      height: 140,
                    ),
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  Text(
                    "Verify your email",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5),
                  ),
                  SizedBox(
                    height: defaultPadding * 0.8,
                  ),
                  Text(
                    "To confirm your email please tap the link sent to d*****4@gmail.com",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  SizedBox(height: size.height * 0.05),
                  //buildTimer(),
                  DefaultButton(
                      size: size,
                      text: 'Open email app',
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerificationSuccessful()),
                        );
                      }),
                  SizedBox(height: size.height * 0.03),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding,
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          child: Text(
                            "Resend OTP Code",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()),
                            );
                          },
                          child: Text(
                            "Change Email",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expire in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 60.0, end: 0.0),
          duration: Duration(seconds: 60),
          builder: (_, val, child) => Text(
            "00:$val",
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
