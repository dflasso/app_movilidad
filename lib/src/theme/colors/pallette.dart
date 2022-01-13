import 'package:flutter/rendering.dart';
import 'package:geo_espe_app_movilidad/src/theme/colors/color_model.dart';

class Pallette {
  static ColorModel secondary = ColorModel(
    main: const Color.fromRGBO(255, 214, 0, 0.90),
    light: const Color.fromRGBO(255, 255, 82, 0.74),
    dark: const Color.fromRGBO(199, 165, 0, 0.74),
    contrastText: const Color.fromRGBO(255, 214, 0, 0.90),
    text: const Color.fromRGBO(11, 83, 69, 0.80),
  );

  static ColorModel background = ColorModel(
    main: const Color.fromRGBO(165, 214, 167, 0.74),
    light: const Color.fromRGBO(165, 214, 167, 0.74),
    dark: const Color.fromRGBO(165, 214, 167, 0.74),
    contrastText: const Color.fromRGBO(165, 214, 167, 0.74),
    text: const Color.fromRGBO(165, 214, 167, 0.74),
  );

  static ColorModel primary = ColorModel(
    main: const Color.fromRGBO(165, 214, 167, 0.74),
    light: const Color.fromRGBO(215, 255, 217, 0.92),
    dark: const Color.fromRGBO(11, 83, 69, 0.80),
    contrastText: const Color.fromRGBO(255, 255, 255, 0.74),
    text: const Color.fromRGBO(18, 102, 23, 0.24),
  );

  static ColorModel error = ColorModel(
    main: const Color.fromRGBO(213, 0, 0, 1.00),
    light: const Color.fromRGBO(255, 81, 49, 0.92),
    dark: const Color.fromRGBO(155, 0, 0, 0.90),
    contrastText: const Color.fromRGBO(229, 115, 115, 0.74),
    text: const Color.fromRGBO(255, 255, 255, 0.90),
  );
}
