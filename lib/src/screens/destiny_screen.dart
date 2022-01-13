import 'package:flutter/material.dart';
import 'package:geo_espe_app_movilidad/src/components/app_bar_generic.dart';
import 'package:geo_espe_app_movilidad/src/components/navigation_bar_generic.dart';
import 'package:geo_espe_app_movilidad/src/modules/destiny/ListDestinies.dart';
import 'package:geo_espe_app_movilidad/src/modules/destiny/destiny.dart';

class DestinyScreen extends StatelessWidget {
  const DestinyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String grSectionsTarget = "-";

    if (ModalRoute.of(context) != null) {
      if (ModalRoute.of(context)!.settings.arguments != null) {
        Map<String, String> arguments =
            ModalRoute.of(context)!.settings.arguments as Map<String, String>;
        grSectionsTarget = arguments['parentSection'] ?? "-";
      }
    }

    return Scaffold(
      appBar: const AppBarGeneric(title: "Destinos"),
      body: Container(
        decoration: getDecorationDefaultScreen(),
        child: ListDestinies(parentSection: grSectionsTarget),
      ),
      bottomNavigationBar: const NavigatorBarGeneric(selectedIndex: 0),
    );
  }
}
