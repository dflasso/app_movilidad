// ignore_for_file: slash_for_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geo_espe_app_movilidad/src/screens/current_location.dart';
import 'package:geo_espe_app_movilidad/src/screens/screens.dart';
import 'package:geo_espe_app_movilidad/src/screens/settings_screen.dart';

/**
 * Mapa que contienen todas las posibles pantallas de la aplicación
 * @autor dflasso
 */
Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'home': (BuildContext context) => const HomePage(),
    'map': (BuildContext context) => const MapScreen(),
    'destiny': (BuildContext context) => const DestinyScreen(),
    'summary_travel': (BuildContext context) => const SummaryTravelScreen(),
    'current_location': (BuildContext context) => const CurrentLocation(),
    'settings': (BuildContext context) => const SettingsScreem()
  };
}

/**
 * retorna la pantalla que se renderiza al iniciar la aplicacion
 * @autor dflasso
 */
String getInitialRoute() => "home";

/**
 * Función que gestiona rutas no mapiadas en la función: getApplicationRoutes()
 * @autor dflasso
 */
MaterialPageRoute handleOnGenereteRoute(RouteSettings settings) {
  switch (settings.name) {
    default:
      return MaterialPageRoute(builder: (context) => const HomePage());
  }
}
