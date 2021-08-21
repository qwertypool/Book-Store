import 'package:flutter/material.dart';
import '../constantParameters.dart';

class HaveAccountCheck extends StatelessWidget {
  const HaveAccountCheck({
    Key? key,
    required this.text,
    required this.text2,
    required this.routeName,
  }) : super(key: key);
  final String text;
  final String text2;
  final String routeName;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$text have an account? ",
          style: TextStyle(fontSize: 16),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, routeName),
          child: Text(
            "Sign $text2",
            style: TextStyle(fontSize: 16, color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}