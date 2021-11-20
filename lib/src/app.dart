import 'package:flutter/material.dart';
import 'package:geo_espe_app_movilidad/src/routes/routes_app.dart';

//Configura la aplicación, como el tema, rutas, entre otros
//@autor dflasso
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movilidad Espe',
      initialRoute: getInitialRoute(),
      routes: getApplicationRoutes(),
      onGenerateRoute: handleOnGenereteRoute,
    );
  }
}
