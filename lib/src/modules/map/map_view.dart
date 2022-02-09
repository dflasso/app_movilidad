import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:geo_espe_app_movilidad/src/model/point_model.dart';
import 'package:geo_espe_app_movilidad/src/providers/destienies_provider.dart';
import 'package:geo_espe_app_movilidad/src/providers/points_provider.dart';
import 'package:geo_espe_app_movilidad/src/repositories/section_repository.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

//flutter pub add flutter_webview_plugin
class _MapViewState extends State<MapView> {
  void requestPermission() async {
    Map<Permission, PermissionStatus> statuses =
        await [Permission.location].request();
  }

  @override
  void initState() {
    super.initState();

    requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    final destiniesProvider =
        Provider.of<DestiniesProvider>(context, listen: true);

    final pointsProvider = Provider.of<PointsProvider>(context, listen: true);

    pointsProvider.destiny =
        destiniesProvider.getDestinySelected() ?? getDefaultSection();

    PointModel pointSelected = pointsProvider.pointDestinySelected;

    return InAppWebView(
      initialUrlRequest: URLRequest(
          url: Uri.parse(
              "https://app-movilidad-map.vercel.app/google_maps?destinationLatitude=${pointSelected.latitude}&destinationLongitude=${pointSelected.length}")),
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
