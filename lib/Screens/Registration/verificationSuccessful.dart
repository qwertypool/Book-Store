import 'package:book_store/Components/defaultButton.dart';
import 'package:book_store/Screens/Home/mainPage.dart';
import 'package:flutter/material.dart';

import '../../constantParameters.dart';

class VerificationSuccessful extends StatelessWidget {
  const VerificationSuccessful({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: defaultPadding*4,),
              SizedBox(
                width: double.infinity,
                child:Image.asset('assets/images/verificationSuccessful.png',
                fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(height:defaultPadding*2,),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Spacer(),
                  Text(
                      "Verified!",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5),
                    ),
                    SizedBox(width: defaultPadding,),
                    Icon(Icons.check_circle,size: 75,color: Colors.blue,),
                    Spacer(),
                ],
              ),
              Text(
              "Congratulations! your account \n is successfully verified.",
              textAlign: TextAlign.center,
              style: TextStyle(color: kSecondaryColor,letterSpacing: 1),
              ),
            SizedBox(height: size.height * 0.1),
            DefaultButton(size: size, text: 'Go to Dashboard', press: (){
              Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage()),
                          );
            })
            ],
          ),
        ),
      ),
    );
  }
}
