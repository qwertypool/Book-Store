import 'package:book_store/Components/defaultButton.dart';
import 'package:book_store/Components/socialCart.dart';
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
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Sign In',style: TextStyle(fontWeight: FontWeight.w600),),
        centerTitle: true,
        toolbarHeight: 100,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SizedBox(height: size.height*0.02,),
                Text(
                  'Welcome ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5
                      ),
                ),
                SizedBox(height: defaultPadding*0.3,),
                Text(
                  'Sign in with email/password \nor continue with social media',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      letterSpacing: 1,
                      //fontSize: 14,
                      fontWeight: FontWeight.w500),
                
                ),
                 SizedBox(height: size.height*0.08,),
                 SignInForm(),
                 //Spacer(flex: 2,),
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
                SizedBox(height: defaultPadding*0.5,),
                NoAccountText(),
                Spacer(),
            
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
  final List<String> errors = [];
    String? password;
    String? email;
    bool remember = false;

  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    return Form(
        child: Column(
      children: [
        buildEmailField(),
        SizedBox(
          height: defaultPadding*1.5,
        ),
        buildPasswordField(),
        SizedBox(
          height: defaultPadding*2.5,
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
                Navigator.pushNamed(
                context, ForgotPassword.routeName),
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
        cursorColor: Colors.black,
        cursorHeight: 20,
        obscureText: true,
        decoration: InputDecoration(
          labelText: "Password",
          hintText: "Enter Your Password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Icon(Icons.lock),
          ),
        ),
      );
  }

  TextFormField buildEmailField() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.black,
        cursorHeight: 20,
        decoration: InputDecoration(
          labelText: "Email",
          hintText: "Enter Your Email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
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
            style: TextStyle(
                fontSize: 16,
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}