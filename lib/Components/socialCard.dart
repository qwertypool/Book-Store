
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocalCard extends StatelessWidget {
  const SocalCard({
    Key? key,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String icon;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin:EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(10),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          // color: Color(0xFFF5F9F9),
          color: Colors.grey[100],
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}