import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: slash_for_doc_comments
/**
 * Boton que redirecciona al usuario a la pantalla que 
 * le permite seleccionar el destino
 * @autor dflasso
 */
class BtnHomeStart extends StatelessWidget {
  const BtnHomeStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style:
            ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
        onPressed: () => Navigator.pushNamed(context, "destiny"),
        child: const Text("Empezar"),
      ),
    );
  }
}
