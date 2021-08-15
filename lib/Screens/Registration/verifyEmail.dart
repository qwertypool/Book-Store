import 'package:book_store/Components/defaultButton.dart';
import 'package:book_store/Screens/Registration/signUp.dart';
import 'package:book_store/Screens/Registration/verificationSuccessful.dart';
import 'package:flutter/material.dart';

import '../../constantParameters.dart';

class VerifyEmail extends StatefulWidget {
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
                    height: size.height*0.3,
                  ),
                    Text(
                      "Verify Email",
                      style: TextStyle(
              
                          color: kPrimaryColor,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5),
                    ),
                    SizedBox(
                      height: defaultPadding * 0.8,
                    ),
                    Text(
                      "Please enter the code sent to deepapandey364@gmail.com",
                     textAlign: TextAlign.center,
                     
                    ),
                    SizedBox(height: size.height * 0.05),
                  //buildTimer(),
                  
                  Container(
                    width: size.width*0.85,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(50)
                      ),
                    child: Center(
                      child: Form(child: TextFormField(
                        obscureText: true,
                        style: TextStyle(fontSize: 24),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        cursorHeight: 25,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: kSecondaryColor)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: kSecondaryColor)
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: kSecondaryColor)
                          ),
                        )
                      )),
                    ),
                  ),
                  SizedBox(height: size.height * 0.04),
                  DefaultButton(size: size, text: 'Confirm', press: (){
                    Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => VerificationSuccessful()),
                          );
                  }
                ),
                  SizedBox(height: size.height * 0.04),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: defaultPadding,),
                    child: Row(
                      children: [
                        InkWell(
                          child: Text(
                            "Resend OTP Code",
                            style: TextStyle(decoration: TextDecoration.underline),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: (){
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUpScreen()),
                          );
                          },
                          child: Text(
                            "Change Email",
                            style: TextStyle(decoration: TextDecoration.underline),
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
