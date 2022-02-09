import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:geo_espe_app_movilidad/src/theme/theme.dart';
import 'package:geolocator/geolocator.dart';

///Boton que redirecciona al usuario a la pantalla que
///le permite seleccionar el destino
///@autor dflasso
class BtnHomeStart extends StatefulWidget {
  const BtnHomeStart({Key? key}) : super(key: key);

  @override
  State<BtnHomeStart> createState() => _BtnHomeStartState();
}

class _BtnHomeStartState extends State<BtnHomeStart> {
  final AudioCache audioCache = AudioCache();

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      audioCache.play("sounds/ubicacion_descactivada.mp3");
      _showMyDialog("Permiso para determinar la ubicación está desactivado.");
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        audioCache.play("sounds/ubicacipon_denegada.mp3");
        _showMyDialog("Permiso para determinar la ubicación fue denegado.");
        return Future.error('Location permissions are denied.');
      }
    }

    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      //await _getAddress();
      audioCache.play("sounds/bienvenido.mp3");
    }).catchError((e) {
      audioCache.play("sounds/ubicacion_error.mp3");
      _showMyDialog(
          "Ocurrio un error al obtener su ubicación, por favor verifique que el servicio 'ubicación' se encuentre activo. ");
    });
  }

  Future<void> _showMyDialog(String text) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[Text(text)],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation().then((value) => {});
  }

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
              onPressed: () {
                audioCache.play("sounds/seleccion_destino.mp3");
                Navigator.pushNamed(context, "destiny");
              },
              child: const Text("Empezar"),
            )
          ],
        ),
      ),
    );
  }
}
