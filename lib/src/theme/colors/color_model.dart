import 'package:flutter/rendering.dart';

class ColorModel {
  Color main;
  Color light;
  Color dark;
  Color contrastText;
  Color text;

  ColorModel(
      {required this.main,
      required this.light,
      required this.dark,
      required this.contrastText,
      required this.text});
}
