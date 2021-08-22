import 'package:book_store/Authentication/firebase_authentication.dart';
import 'package:book_store/Components/defaultButton.dart';
import 'package:book_store/Components/haveAccountCheck.dart';
import 'package:book_store/Components/socialMediaRegistration.dart';
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
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5),
                ),
                SizedBox(
                  height: defaultPadding * 2,
                ),
                SignInForm(),
                SizedBox(
                  height: size.height * 0.03,
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
                SizedBox(
                  height: defaultPadding * 1.5,
                ),
                SocialMediaRegistration(
                  size: size,
                  iconName: 'google.svg',
                  socialName: 'Sign In with Google',
                  press: () {},
                ),
                SizedBox(
                  height: defaultPadding * 1.5,
                ),
                HaveAccountCheck(
                  text: 'Dont',
                  routeName: SignUpScreen.routeName,
                  text2: 'Up',
                ),
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
        key: _formKey,
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
                if (_formKey.currentState!.validate()) {
                  authClass.signInWithEmail(
                      email: _emailController.text,
                      password: _passwordController.text,
                      context: context);
                }
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
        if (value!.length < 1) return "Please enter valid password";
        return null;
      },
      cursorColor: Colors.black,
      cursorHeight: 20,
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: TextStyle(
            fontWeight: FontWeight.w500, letterSpacing: 1.2, fontSize: 16),
        contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        focusedErrorBorder: outlineInputBorder(),
        errorBorder: outlineInputBorder(),
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
        contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        focusedErrorBorder: outlineInputBorder(),
        errorBorder: outlineInputBorder(),
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
