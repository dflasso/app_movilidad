import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      appBar: AppBar(
        title: const Text("Destinos"),
      ),
      body: Container(
        decoration: getDecorationDefaultScreen(),
        child: ListDestinies(parentSection: grSectionsTarget),
      ),
    );
  }
}
