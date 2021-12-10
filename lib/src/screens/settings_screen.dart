import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geo_espe_app_movilidad/src/components/app_bar_generic.dart';
import 'package:geo_espe_app_movilidad/src/components/navigation_bar_generic.dart';
import 'package:geo_espe_app_movilidad/src/modules/destiny/decoration_background_screen.dart';
import 'package:geo_espe_app_movilidad/src/modules/settings/main_content.dart';

class SettingsScreem extends StatelessWidget {
  const SettingsScreem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarGeneric(title: "Configuraciones"),
      body: Container(
        decoration: getDecorationDefaultScreen(),
        child: const ContentSettings(),
      ),
      bottomNavigationBar: const NavigatorBarGeneric(selectedIndex: 2),
    );
  }
}
