import 'package:book_store/Authentication/firebase_authentication.dart';
import 'package:book_store/Components/defaultButton.dart';
import 'package:book_store/Screens/Registration/signUp.dart';
import 'package:flutter/material.dart';
import '../../constantParameters.dart';

AuthClass authClass = AuthClass();

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
        appBar: AppBar(),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    'Reset Password',
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2),
                  ),
                  SizedBox(
                    height: defaultPadding * 0.5,
                  ),
                  Text(
                    "Please enter your email and we will send \nyou a link to return to your account",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: size.height * 0.1),
                  ForgotPassForm(),
                ],
              ),
            ),
          ),
        ));
  }
}

class ForgotPassForm extends StatefulWidget {
  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  TextEditingController forgotemailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: forgotemailcontroller,
            validator: (value) {
              if (value!.isEmpty) return "Invalid Email";
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "Email",
              labelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                  fontSize: 16),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              enabledBorder: outlineInputBorder(),
              focusedBorder: outlineInputBorder(),
              suffixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Icon(Icons.email),
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
                authClass.resetPassword(
                email: forgotemailcontroller.text, context: context);
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

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(color: kTextColor),
    gapPadding: 2,
  );
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
            style: TextStyle(fontSize: 16, color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
