import 'package:flutter/widgets.dart';
import 'package:learning_english/test_social_knowledge/colors_test.dart';

Widget normalText(
  {
    String? text, Color? color, double? size,
  }
){
  return Text(
    text!, 
    style: TextStyle(
      fontSize: size,
      color: color,
    ),
  );          
}

Widget headingText(
  {
    String? text, Color? color, double? size,
  }
){
  return Text(
    text!, 
    style: TextStyle(
      fontSize: size,
      color: color,
    ),
  );          
}