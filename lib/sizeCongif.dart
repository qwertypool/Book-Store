import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth = 0.0;
  static double? screenHeight = 0.0;
  static double? defaultSize = 0.0;
  static Orientation? orientation = orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double? screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  if (screenHeight != null) {
    return (inputHeight / 812.0) * screenHeight;
  } else
    return 0.0;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double? screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  if(screenWidth != null){
    return (inputWidth / 375.0) * screenWidth;
  }
  else
  return 0.0;
}
