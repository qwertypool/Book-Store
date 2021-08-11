import 'package:book_store/Components/defaultButton.dart';
import 'package:book_store/Screens/Registration/signUp.dart';
import 'package:flutter/material.dart';

import '../../constantParameters.dart';

class ForgotPassword extends StatefulWidget {
  static String routeName = '/forgotPasswordRoute';
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
   Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Forgot Password",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
      //   centerTitle: true,
      //   toolbarHeight: 100,
      // ),
      body: SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: size.height*0.15,),
                Text(
                  'Reset Password',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2
                      ),
                ),
                SizedBox(height: defaultPadding*0.5,),
              Text(
                "Please enter your email and we will send \nyou a link to return to your account",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size.height*0.1),
              ForgotPassForm(),
            ],
          ),
        ),
      ),
    )
    );
  }
}
class ForgotPassForm extends StatefulWidget {
  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "Email",
              labelStyle: TextStyle(fontWeight: FontWeight.w500,letterSpacing: 1.2,fontSize: 16),
              hintText: "Enter your email",
              hintStyle: TextStyle(fontSize: 15,color: kSecondaryColor.withOpacity(0.95)),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Icon(Icons.email_outlined),
          ),
            ),
          ),
          SizedBox(height: 30),
          DefaultButton(
            text: "Reset Password",
            size: size,
            press: () {
              if (_formKey.currentState!.validate()) {
                // Do what you want to do
              }
            },
          ),
          SizedBox(height: size.height * 0.05),
          NoAccountText(),
        ],
      ),
    );
  }
}
class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: 16),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontSize: 16,
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}