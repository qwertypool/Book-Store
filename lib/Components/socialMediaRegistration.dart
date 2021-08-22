import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constantParameters.dart';

class SocialMediaRegistration extends StatelessWidget {
  const SocialMediaRegistration({
    Key? key,
    required this.size,
    required this.iconName,
    required this.socialName,
    required this.press,
  }) : super(key: key);

  final Size size;
  final String? iconName;
  final String socialName;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(maxWidth: size.width * 0.8, minHeight: 52),
      elevation: 10,
      fillColor: Colors.grey[200],
      onPressed: press,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 23,
            width: 23,
            // child: SvgPicture.asset('assets/svgs/google.svg'),
            child: SvgPicture.asset('assets/svgs/$iconName'),
          ),
          SizedBox(
            width: defaultPadding,
          ),
          Text(
            socialName,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          )
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
