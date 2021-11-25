import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geo_espe_app_movilidad/src/theme/theme.dart';

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
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 50.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  fixedSize: const Size(300.0, 35.0),
                  primary: Pallette.primary.dark),
              onPressed: () => Navigator.pushNamed(context, "destiny"),
              child: const Text("Empezar"),
            )
          ],
        ),
      ),
    );
  }
}
