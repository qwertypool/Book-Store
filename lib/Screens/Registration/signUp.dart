import 'package:book_store/Authentication/firebase_authentication.dart';
import 'package:book_store/Components/defaultButton.dart';
import 'package:book_store/Components/socialCard.dart';
import 'package:flutter/material.dart';

import '../../constantParameters.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/SignUpScreen";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5),
                  ),
                  SizedBox(
                    height: defaultPadding * 0.5,
                  ),
                  Text(
                    "Complete your details or continue \nwith social media",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: size.height * 0.08),
                  SignUpForm(),
                  SizedBox(
                    height: size.height * 0.07,
                  ),
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
  bool isConfirmVisible = false;
  bool isVisible = false;
  AuthClass authClass = AuthClass();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: defaultPadding * 1.5),
          buildPasswordFormField(),
          SizedBox(height: defaultPadding * 1.5),
          buildConformPassFormField(),
          SizedBox(height: defaultPadding * 2),
          DefaultButton(
            text: "Sign Up",
            size: size,
            press: () {
              if (_formKey.currentState!.validate()) {
                authClass.signInWithEmail(
                  email: _emailController.text,
                  password: _passwordController.text,
                  confirmPassword: _confirmPasswordController.text,
                  context: context,
                );
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: !isConfirmVisible,
      controller: _confirmPasswordController,
      validator: (value) {
        if (value!.length < 6) return "Password length should atleast be 6";
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        labelStyle: TextStyle(
            fontWeight: FontWeight.w500, letterSpacing: 1.2, fontSize: 16),
        hintText: "Re-enter your password",
        hintStyle:
            TextStyle(fontSize: 15, color: kSecondaryColor.withOpacity(0.95)),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        errorBorder: outlineInputBorder(),
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: InkWell(
            child: Icon(
                isConfirmVisible ? Icons.visibility : Icons.visibility_off),
            onTap: () {
              setState(() {
                isConfirmVisible = !isConfirmVisible;
              });
            },
          ),
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: !isVisible,
      controller: _passwordController,
      validator: (value) {
        if (value!.length < 6) return "Password length should atleast be 6";
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: TextStyle(
            fontWeight: FontWeight.w500, letterSpacing: 1.2, fontSize: 16),
        hintText: "Enter your password",
        hintStyle:
            TextStyle(fontSize: 15, color: kSecondaryColor.withOpacity(0.95)),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        enabledBorder: outlineInputBorder(),
        errorBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: InkWell(
            child: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
            onTap: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
          ),
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: _emailController,
      validator: (value) {
        if (value!.isEmpty) return "Email can't be empty";
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        labelStyle: TextStyle(
            fontWeight: FontWeight.w500, letterSpacing: 1.2, fontSize: 16),
        hintText: "Enter your email",
        hintStyle:
            TextStyle(fontSize: 15, color: kSecondaryColor.withOpacity(0.95)),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        errorBorder: outlineInputBorder(),
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
