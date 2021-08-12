import 'package:book_store/Components/defaultButton.dart';
import 'package:book_store/Components/socialCard.dart';
import 'package:book_store/Screens/Home/mainPage.dart';
import 'package:book_store/Screens/Registration/login.dart';
import 'package:flutter/material.dart';

import '../../constantParameters.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/SignUpScreen";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      // appBar: AppBar(
      //   leading: BackButton(),
      //   title: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.w600),),
      //   centerTitle: true,
      //   toolbarHeight: 100,
      // ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: size.height*0.1,),
                  Text("Sign Up", style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5
                      ),),
                  SizedBox(height: defaultPadding*0.5,),
                  Text(
                    "Complete your details or continue \nwith social media",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: size.height* 0.08),
                  SignUpForm(),
                  SizedBox(height: size.height*0.07,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocalCard(
                        icon: "assets/svgs/google.svg",
                        press: () {},
                      ),
                      SocalCard(
                        icon: "assets/svgs/facebook.svg",
                        press: () {},
                      ),
                      SocalCard(
                        icon: "assets/svgs/twitter.svg",
                        press: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'By continuing your confirm that you agree \nwith our Term and Condition',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  bool remember = false;


  @override
  Widget build(BuildContext context) {
       Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: defaultPadding*1.5),
          buildPasswordFormField(),
          SizedBox(height: defaultPadding*1.5),
          buildConformPassFormField(),
          SizedBox(height: defaultPadding*2),
          DefaultButton(
            text: "Sign Up",
            size: size,
            press: () {
              // if (_formKey.currentState.validate()) {
              //   _formKey.currentState.save();
              //   // if all are valid then go to success screen
               
              // }
               //Navigator.pushNamed(context, MainPage.routeName);
               Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      // onSaved: (newValue) => conform_password = newValue,
      // onChanged: (value) {
      //   if (value.isNotEmpty) {
      //     removeError(error: kPassNullError);
      //   } else if (value.isNotEmpty && password == conform_password) {
      //     removeError(error: kMatchPassError);
      //   }
      //   conform_password = value;
      // },
      // validator: (value) {
      //   if (value.isEmpty) {
      //     addError(error: kPassNullError);
      //     return "";
      //   } else if ((password != value)) {
      //     addError(error: kMatchPassError);
      //     return "";
      //   }
      //   return null;
      // },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        labelStyle: TextStyle(fontWeight: FontWeight.w500,letterSpacing: 1.2,fontSize: 16),
        hintText: "Re-enter your password",
        hintStyle: TextStyle(fontSize: 15,color: kSecondaryColor.withOpacity(0.95)),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        suffixIcon:  Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Icon(Icons.lock_outline),
          ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: TextStyle(fontWeight: FontWeight.w500,letterSpacing: 1.2,fontSize: 16),
        hintText: "Enter your password",
        hintStyle: TextStyle(fontSize: 15,color: kSecondaryColor.withOpacity(0.95)),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        suffixIcon:  Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Icon(Icons.lock_outline),
          ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        labelStyle: TextStyle(fontWeight: FontWeight.w500,letterSpacing: 1.2,fontSize: 16),
        hintText: "Enter your email",
        hintStyle: TextStyle(fontSize: 15,color: kSecondaryColor.withOpacity(0.95)),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        suffixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Icon(Icons.email_outlined),
          ),
      ),
    );
  }
}
OutlineInputBorder outlineInputBorder() {
return OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: kTextColor),
        gapPadding: 2,
      );
}