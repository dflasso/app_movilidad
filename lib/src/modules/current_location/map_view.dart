import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:permission_handler/permission_handler.dart';

class MapViewCurrentLocation extends StatefulWidget {
  const MapViewCurrentLocation({Key? key}) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

//flutter pub add flutter_webview_plugin
class _MapViewState extends State<MapViewCurrentLocation> {
  void requestPermission() async {
    await [Permission.location].request();
  }

  @override
  void initState() {
    super.initState();

    requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialUrlRequest: URLRequest(
          url: Uri.parse(
              "https://app-movilidad-map.vercel.app/current_location_arcgis")),
      androidOnGeolocationPermissionsShowPrompt:
          (InAppWebViewController controller, String origin) async {
        bool? result = await showDialog<bool>(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text(" Permitir acceso a ubicación"),
                content: SingleChildScrollView(
                    child: ListBody(children: const <Widget>[
                  Text(" Permitir acceso a ubicación")
                ])),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: const Text("Permitir")),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: const Text("Denegar"))
                ],
              );
            });
        if (result == null) {
          return Future.value(GeolocationPermissionShowPromptResponse(
              origin: origin, allow: false, retain: false));
        } else if (result) {
          return Future.value(GeolocationPermissionShowPromptResponse(
              origin: origin, allow: true, retain: true));
        } else {
          return Future.value(GeolocationPermissionShowPromptResponse(
              origin: origin, allow: false, retain: false));
        }
      },
    );
  }
}
