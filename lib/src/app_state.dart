import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
import 'package:geo_espe_app_movilidad/src/app.dart';
import 'package:geo_espe_app_movilidad/src/providers/destienies_provider.dart';
import 'package:geo_espe_app_movilidad/src/providers/geo_localization_provider.dart';
import 'package:geo_espe_app_movilidad/src/providers/google_drive_provider.dart';
import 'package:geo_espe_app_movilidad/src/providers/points_provider.dart';
import 'package:provider/provider.dart';

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DestiniesProvider(), lazy: false),
        ChangeNotifierProvider(create: (_) => GoolgleProvider()),
        ChangeNotifierProvider(create: (_) => GeoLocalizationProvider()),
        ChangeNotifierProvider(create: (_) => PointsProvider(), lazy: false),
      ],
      child: const MyApp(),
    );
  }
}
