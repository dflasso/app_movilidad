import 'package:flutter/rendering.dart';

///@returns los estilos del container principal de la pagina
///@autor dflasso
BoxDecoration getDecorationDefaultScreen() {
  return const BoxDecoration(
      image: DecorationImage(
    image: AssetImage('assets/img/background.png'),
    fit: BoxFit.cover,
  ));
}
