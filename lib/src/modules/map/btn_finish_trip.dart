import 'package:flutter/material.dart';
import 'package:geo_espe_app_movilidad/src/theme/theme.dart';

class BtnFinishTrip extends StatefulWidget {
  const BtnFinishTrip({Key? key}) : super(key: key);

  @override
  _BtnFinishTripState createState() => _BtnFinishTripState();
}

class _BtnFinishTripState extends State<BtnFinishTrip> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, "settings"),
      child: const Icon(Icons.save),
      backgroundColor: Pallette.primary.dark,
    );
  }
}
