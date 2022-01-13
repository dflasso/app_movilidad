import 'package:flutter/material.dart';
import 'package:geo_espe_app_movilidad/src/app_state.dart';

///Función principal que lenvanta el proyecto
///@autor dflasso
void main() {
  /// permite implementar patrón Singlenton con las intacias que se inicializan por defecto en los Widgets
  WidgetsFlutterBinding.ensureInitialized();

  ///Ejecuta la app
  runApp(const AppState());
}
