import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:geo_espe_app_movilidad/src/modules/home/index.dart';
import 'package:location/location.dart';

// ignore: slash_for_doc_comments
/**
 * Pantalla Inicial de la Aplicación
 * @autor dflasso
 */
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Location locationDevice = Location();
  bool _serviceEnabled = false;
  PermissionStatus? _permissionGranted;
  final AudioCache audioCache = AudioCache();

  verifyServiceEnable() async {
    _serviceEnabled = await locationDevice.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await locationDevice.requestService();
      if (!_serviceEnabled) {
        return;
      } else {
        audioCache.play("sounds/ubicacion_descactivada.mp3");
      }
    } else {
      audioCache.play("sounds/ubicacion_descactivada.mp3");
    }
  }

  verifyPermissonsLocalization() async {
    _permissionGranted = await locationDevice.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await locationDevice.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      } else {
        audioCache.play("sounds/ubicacipon_denegada.mp3");
      }
    } else {
      audioCache.play("sounds/ubicacipon_denegada.mp3");
    }
  }

  void getCurrentLocation() async {
    verifyServiceEnable();
    verifyPermissonsLocalization();
    await locationDevice.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const BtnHomeStart(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/img/Home_Background.png'),
                fit: BoxFit.cover)),
      ),
    );
  }
}
