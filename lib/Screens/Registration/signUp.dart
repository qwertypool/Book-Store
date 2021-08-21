import 'package:book_store/Authentication/firebase_authentication.dart';
import 'package:book_store/Components/defaultButton.dart';
import 'package:book_store/Components/haveAccountCheck.dart';
import 'package:book_store/Components/socialMediaRegistration.dart';
import 'package:book_store/Screens/Registration/login.dart';
import 'package:flutter/material.dart';
import '../../constantParameters.dart';

AuthClass authClass = AuthClass();

class SignUpScreen extends StatelessWidget {
  static String routeName = "/SignUpScreen";
  SignUpScreen({Key? key}) : super(key: key);

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
                    height: size.height * 0.085,
                  ),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5),
                  ),
                  SizedBox(height: size.height * 0.02),
                  SignUpForm(),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey[600],
                          height: 1.5,
                        ),
                      ),
                      Text(
                        '  OR  ',
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey[600],
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: defaultPadding*1.5,),
                  SocialMediaRegistration(
                    size: size,
                    iconName: 'google.svg',
                    socialName: 'Google',
                    press: () {},
                  ),
                  SizedBox(height: defaultPadding*1.5),
                  HaveAccountCheck(
                    text: 'Already',
                    routeName: LoginScreen.routeName,
                    text2: 'In',
                  ),
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
          SizedBox(height: defaultPadding * 1.2),
          buildEmailFormField(),
          SizedBox(height: defaultPadding * 1.2),
          buildPasswordFormField(),
          SizedBox(height: defaultPadding * 1.2),
          buildConfirmPassFormField(),
          SizedBox(height: defaultPadding * 2),
          DefaultButton(
            text: "Sign Up",
            size: size,
            press: () {
              if (_formKey.currentState!.validate()) {
                authClass.signUpWithEmail(
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


  TextFormField buildConfirmPassFormField() {
    return TextFormField(
      obscureText: !isConfirmVisible,
      controller: _confirmPasswordController,
      validator: (value) {
        if (value!.length < 6) return "Password should atleast be 6 characters";
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        labelStyle: TextStyle(
            fontWeight: FontWeight.w500, letterSpacing: 1.2, fontSize: 16),
        contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        errorBorder: outlineInputBorder(),
        focusedErrorBorder: outlineInputBorder(),
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: InkWell(
            child: Icon(
              isConfirmVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.black.withOpacity(0.8),
            ),
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
        if (value!.length < 6) return "Password should atleast be 6 characters";
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: TextStyle(
            fontWeight: FontWeight.w500, letterSpacing: 1.2, fontSize: 16),
        contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        enabledBorder: outlineInputBorder(),
        errorBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        focusedErrorBorder: outlineInputBorder(),
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: InkWell(
            child: Icon(
              isVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.black.withOpacity(0.8),
            ),
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
        if (value!.isEmpty) return "Invalid Email";
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        labelStyle: TextStyle(
            fontWeight: FontWeight.w500, letterSpacing: 1.2, fontSize: 16),
        contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        errorBorder: outlineInputBorder(),
        focusedErrorBorder: outlineInputBorder(),
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: Icon(
            Icons.email,
            color: Colors.black.withOpacity(0.8),
          ),
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


