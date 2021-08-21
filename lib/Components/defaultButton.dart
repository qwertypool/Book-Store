import 'package:flutter/material.dart';
import '../constantParameters.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.size,
    required this.text,
    required this.press,
  }) : super(key: key);

  final Size size;
  final String text;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(minWidth: size.width * 0.85, minHeight: 55),
      elevation: 15,
      fillColor: kPrimaryColor,
      splashColor: Colors.white,
      onPressed: press,
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 21, letterSpacing: 1),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
    );
  }
}