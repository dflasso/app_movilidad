import 'package:flutter/material.dart';
import 'package:geo_espe_app_movilidad/src/modules/home/index.dart';

// ignore: slash_for_doc_comments
/**
 * Pantalla Inicial de la Aplicación
 * @autor dflasso
 */
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const BtnHomeStart(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/img/Home_Background.png'),
                fit: BoxFit.cover)),
      ),
    );
  }
}
