import 'package:book_store/Authentication/firebase_authentication.dart';
import 'package:book_store/Components/defaultButton.dart';
import 'package:book_store/Components/socialCard.dart';
import 'package:book_store/Screens/Registration/signUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../constantParameters.dart';
import 'forgotPassword.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/loginScreen";
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.15,
                ),
                Text(
                  'Sign In ',
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
                  'Sign in with email/password \nor continue with social media',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      letterSpacing: 1,
                      //fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: size.height * 0.09,
                ),
                SignInForm(),
                //Spacer(flex: 2,),
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
                SizedBox(
                  height: defaultPadding,
                ),
                NoAccountText(),
                // Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignInForm extends StatefulWidget {
  SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  bool remember = false;
  bool isConfirmVisible = false;
  bool isVisible = false;
  AuthClass authClass = AuthClass();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final List<String> errors = [];
  String? password;
  String? email;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
        child: Column(
      children: [
        buildEmailField(),
        SizedBox(
          height: defaultPadding * 1.5,
        ),
        buildPasswordField(),
        SizedBox(
          height: defaultPadding * 2.5,
        ),
        Row(
          children: [
            Checkbox(
              value: remember,
              activeColor: kPrimaryColor,
              onChanged: (value) {
                setState(() {
                  remember = value!;
                });
              },
            ),
            Text("Remember me"),
            Spacer(),
            GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, ForgotPassword.routeName),
              child: Text(
                "Forgot Password",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            )
          ],
        ),
        DefaultButton(
          size: size,
          text: 'Sign In',
          press: () {
            // if (_formKey.currentState!.validate()) {
            // _formKey.currentState!.save();

            //   }
            Navigator.pushNamed(context, SignUpScreen.routeName);
          },
        ),
      ],
    ));
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      obscureText: !isVisible,
      controller: _passwordController,
      validator: (value) {
        if (value!.length <1) return "Please enter valid password";
        return null;
      },
      cursorColor: Colors.black,
      cursorHeight: 20,
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: TextStyle(
            fontWeight: FontWeight.w500, letterSpacing: 1.2, fontSize: 16),
        hintText: "Enter Your Password",
        hintStyle:
            TextStyle(fontSize: 15, color: kSecondaryColor.withOpacity(0.95)),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        focusedErrorBorder: outlineInputBorder(),
        errorBorder: outlineInputBorder(),
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

  TextFormField buildEmailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: _emailController,
      validator: (value) {
        if (value!.isEmpty) return "Please enter your email";
        return null;
      },
      cursorColor: Colors.black,
      cursorHeight: 20,
      decoration: InputDecoration(
        labelText: "Email",
        labelStyle: TextStyle(
            fontWeight: FontWeight.w500, letterSpacing: 1.2, fontSize: 16),
        hintText: "Enter Your Email",
        hintStyle:
            TextStyle(fontSize: 15, color: kSecondaryColor.withOpacity(0.95)),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        focusedErrorBorder: outlineInputBorder(),
        errorBorder: outlineInputBorder(),
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: Icon(Icons.email_outlined),
        ),
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
            style: TextStyle(fontSize: 16, color: kPrimaryColor),
          ),
        ),
      ],
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
