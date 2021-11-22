import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geo_espe_app_movilidad/src/modules/destiny/ListDestinies.dart';
import 'package:geo_espe_app_movilidad/src/modules/destiny/destiny.dart';

class DestinyScreen extends StatelessWidget {
  const DestinyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Destinos"),
      ),
      body: Container(
        decoration: getDecorationDefaultScreen(),
        child: ListDestinies(parentSection: "-"),
      ),
    );
  }
}
