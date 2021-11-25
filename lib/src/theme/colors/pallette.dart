import 'package:flutter/rendering.dart';
import 'package:geo_espe_app_movilidad/src/theme/colors/color_model.dart';

class Pallette {
  static ColorModel secondary = ColorModel(
    main: const Color.fromRGBO(255, 196, 0, 0.50),
    light: const Color.fromRGBO(255, 246, 79, 0.74),
    dark: const Color.fromRGBO(199, 148, 0, 0.74),
    contrastText: const Color.fromRGBO(218, 247, 166, 0.74),
    text: const Color.fromRGBO(214, 137, 16, 0.74),
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
}
