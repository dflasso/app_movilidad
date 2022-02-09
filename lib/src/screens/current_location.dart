import 'package:flutter/material.dart';
import 'package:geo_espe_app_movilidad/src/components/app_bar_generic.dart';
import 'package:geo_espe_app_movilidad/src/components/navigation_bar_generic.dart';
import 'package:geo_espe_app_movilidad/src/modules/current_location/map_view.dart';
import 'package:geo_espe_app_movilidad/src/modules/destiny/decoration_background_screen.dart';
import 'package:geo_espe_app_movilidad/src/modules/map/btn_finish_trip.dart';

class CurrentLocation extends StatelessWidget {
  const CurrentLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarGeneric(title: "Ubicación Actual"),
      body: Container(
          decoration: getDecorationDefaultScreen(),
          child: const MapViewCurrentLocation()),
      floatingActionButton: const BtnFinishTrip(),
      bottomNavigationBar: const NavigatorBarGeneric(selectedIndex: 1),
    );
  }
}
