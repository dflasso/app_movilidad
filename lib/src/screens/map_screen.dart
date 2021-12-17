import 'package:flutter/material.dart';
import 'package:geo_espe_app_movilidad/src/components/app_bar_generic.dart';
import 'package:geo_espe_app_movilidad/src/components/navigation_bar_generic.dart';
import 'package:geo_espe_app_movilidad/src/modules/destiny/decoration_background_screen.dart';
import 'package:geo_espe_app_movilidad/src/modules/map/btn_finish_trip.dart';
import 'package:geo_espe_app_movilidad/src/modules/map/map_view.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarGeneric(title: "Mapa"),
      body: Container(
        decoration: getDecorationDefaultScreen(),
        child: const MapView(),
      ),
      floatingActionButton: const BtnFinishTrip(),
      bottomNavigationBar: const NavigatorBarGeneric(selectedIndex: 0),
    );
  }
}
