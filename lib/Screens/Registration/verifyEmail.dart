import 'package:book_store/Components/defaultButton.dart';
import 'package:book_store/Screens/Registration/login.dart';
import 'package:book_store/Screens/Registration/signUp.dart';
import 'package:flutter/material.dart';
import 'package:open_mail_app/open_mail_app.dart';

import '../../constantParameters.dart';

class VerifyEmailArguments {
  final String email;

  VerifyEmailArguments(this.email);
}

class VerifyEmail extends StatefulWidget {
  static String routeName = '/verifyemailRoute';

  VerifyEmail({Key? key, this.email}) : super(key: key);
  final String? email;
  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as VerifyEmailArguments;
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
                    "To confirm your email please tap the link sent to ${args.email}",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  SizedBox(height: size.height * 0.05),
                  DefaultButton(
                      size: size,
                      text: 'Open email app',
                      press: () async {
                        var result = await OpenMailApp.openMailApp();
                        if (!result.didOpen && !result.canOpen) {
                          final snackBar =
                              SnackBar(content: Text("Could not launch Email"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if (!result.didOpen && result.canOpen) {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return MailAppPickerDialog(
                                mailApps: result.options,
                              );
                            },
                          );
                        } else {
                          Navigator.pushNamedAndRemoveUntil(
                              context, LoginScreen.routeName, (route) => false);
                        }
                      }),
                  SizedBox(height: size.height * 0.03),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding,
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(context,
                                LoginScreen.routeName, (route) => false);
                          },
                          child: Text(
                            "Alredy Verified?",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(context,
                                SignUpScreen.routeName, (route) => false);
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
}
