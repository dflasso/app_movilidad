import 'package:flutter/widgets.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geo_espe_app_movilidad/src/app.dart';
import 'package:geo_espe_app_movilidad/src/providers/destienies_provider.dart';
import 'package:provider/provider.dart';

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DestiniesProvider(), lazy: false),
      ],
      child: const MyApp(),
    );
  }
}
