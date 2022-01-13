import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';
import 'package:geo_espe_app_movilidad/src/model/section_model.dart';
import 'package:geo_espe_app_movilidad/src/modules/summary_travel/btn_go_back_home.dart';
import 'package:geo_espe_app_movilidad/src/modules/summary_travel/detail_summary_travel.dart';
import 'package:geo_espe_app_movilidad/src/modules/summary_travel/header_summary_travel.dart';
import 'package:geo_espe_app_movilidad/src/providers/destienies_provider.dart';
import 'package:geo_espe_app_movilidad/src/providers/geo_localization_provider.dart';
import 'package:geo_espe_app_movilidad/src/repositories/section_repository.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class ContentScreemSumaryTravel extends StatefulWidget {
  const ContentScreemSumaryTravel({Key? key}) : super(key: key);

  @override
  State<ContentScreemSumaryTravel> createState() =>
      _ContentScreemSumaryTravelState();
}

class _ContentScreemSumaryTravelState extends State<ContentScreemSumaryTravel> {
  final Location locationDevice = Location();
  bool _serviceEnabled = false;
  PermissionStatus? _permissionGranted;

  SectionModel _getDestinitySelected() {
    final destiniesProvider =
        Provider.of<DestiniesProvider>(context, listen: true);

    return destiniesProvider.getDestinySelected() ?? getDefaultSection();
  }

  void playAudioTripFinished(SectionModel destinySelected) {
    final AudioCache audioCache = AudioCache();
    audioCache.play(destinySelected.soundTripFinished);
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

  void getCurrentLocation() async {
    final geoLocalizationProvider =
        Provider.of<GeoLocalizationProvider>(context);
    verifyServiceEnable();
    verifyPermissonsLocalization();
    LocationData locationData = await locationDevice.getLocation();
    geoLocalizationProvider.addNewTripLog(locationData);
  }

  @override
  Widget build(BuildContext context) {
    final SectionModel destinySelected = _getDestinitySelected();
    playAudioTripFinished(destinySelected);
    getCurrentLocation();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: const <Widget>[
        HeaderSummaryTravel(),
        DetailSummaryTravel(),
        BtnGoBackHome()
      ],
    );
  }
}
