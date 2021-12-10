import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geo_espe_app_movilidad/src/components/app_bar_generic.dart';
import 'package:geo_espe_app_movilidad/src/components/navigation_bar_generic.dart';
import 'package:geo_espe_app_movilidad/src/modules/destiny/decoration_background_screen.dart';

class CurrentLocation extends StatelessWidget {
  const CurrentLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarGeneric(title: "Ubicación Actual"),
      body: Container(
        child: const Center(child: Text("ubicacion actual")),
        decoration: getDecorationDefaultScreen(),
      ),
      bottomNavigationBar: const NavigatorBarGeneric(selectedIndex: 1),
    );
  }
}
