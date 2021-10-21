import 'package:flutter/material.dart';
import 'package:geo_espe_app_movilidad/src/utils/speecher.dart';
import 'package:location/location.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Location locationDevice = Location();
  bool _serviceEnabled = false;
  PermissionStatus? _permissionGranted;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pantalla de Pruebas"),
        centerTitle: true,
      ),
      body: Center(
          child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        children: <Widget>[_geoLocalizationTest(), const Speecher()],
      )),
    );
  }

  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  Widget _geoLocalizationTest() {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        ElevatedButton(
          style: style,
          onPressed: () async {
            verifyServiceEnable();
            verifyPermissonsLocalization();
            LocationData locationData = await locationDevice.getLocation();
            _showMyDialog(locationData);
          },
          child: const Text('Geo localizacion Test'),
        ),
      ]),
    );
  }

  verifyServiceEnable() async {
    _serviceEnabled = await locationDevice.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await locationDevice.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
  }

  verifyPermissonsLocalization() async {
    _permissionGranted = await locationDevice.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await locationDevice.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  Future<void> _showMyDialog(LocationData locationData) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Datos Obtenidos'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Latitud: ${locationData.latitude}'),
                Text('longitude: ${locationData.longitude}'),
                Text(
                    'precisión: ${locationData.accuracy}'), // Precisión horizontal estimada de esta ubicación, radial, en metros
                Text(
                    'altitud: ${locationData.altitude}'), // En metros por encima del elipsoide de referencia WGS 84
                Text('velocidad (metros/segundo) : ${locationData.speed}'),
                Text(
                    'Precisión de velocidad: ${locationData.speedAccuracy}'), // In meters/second, always 0 on iOS
                Text(
                    'rumbo: ${locationData.latitude}'), //El rumbo es la dirección horizontal de desplazamiento de este dispositivo, en grados.

                Text('time: ${locationData.time}'), // Marca de tiempo
                Text('isMock: ${locationData.isMock}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
