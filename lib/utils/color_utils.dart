import 'package:flutter/material.dart';

hexStringToColor(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if(hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  return Color(int.parse(hexColor, radix: 16));
}
class AppColor {
  static final pripmaryColor = Color(0xFF252c4a);
  static final secondaryColor = Color(0xFF117eeb);
}
