import 'package:flutter/material.dart';
import 'package:geo_espe_app_movilidad/src/components/app_bar_generic.dart';
import 'package:geo_espe_app_movilidad/src/components/navigation_bar_generic.dart';
import 'package:geo_espe_app_movilidad/src/modules/destiny/decoration_background_screen.dart';
import 'package:geo_espe_app_movilidad/src/modules/summary_travel/content_summary_travel.dart';

class SummaryTravelScreen extends StatelessWidget {
  const SummaryTravelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarGeneric(title: "Viaje finalizado"),
      body: Container(
        margin: const EdgeInsets.all(1.0),
        child: const ContentScreemSumaryTravel(),
        decoration: getDecorationDefaultScreen(),
      ),
      bottomNavigationBar: const NavigatorBarGeneric(selectedIndex: 0),
    );
  }
}
