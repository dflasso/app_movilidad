import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geo_espe_app_movilidad/src/components/subtitle.dart';
import 'package:geo_espe_app_movilidad/src/middlewares/whatsapp_middleware.dart';
import 'package:geo_espe_app_movilidad/src/providers/geo_localization_provider.dart';
import 'package:geo_espe_app_movilidad/src/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ReportDestiniesFinished extends StatefulWidget {
  const ReportDestiniesFinished({Key? key}) : super(key: key);

  @override
  State<ReportDestiniesFinished> createState() =>
      _ReportDestiniesFinishedState();
}

class _ReportDestiniesFinishedState extends State<ReportDestiniesFinished> {
  GeoLocalizationProvider? geoLocalizationProvider;
  String pathReporter = "";

  @override
  initState() {
    super.initState();
  }

  TextStyle _getDefaultStyle() {
    return TextStyle(
        color: Pallette.primary.dark,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontSize: 16);
  }

  void _generatedReport() {
    if (geoLocalizationProvider != null) {
      geoLocalizationProvider!
          .createFileWithItemsHistoryTripsFinished()
          .then((historyTrips) {
        openwhatsapp(context, historyTrips).then((isSending) => {
              launch(
                  'mailto:crissmaster96@gmail.com?subject=Reporte_Viajes&body=$historyTrips')
            });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    geoLocalizationProvider =
        Provider.of<GeoLocalizationProvider>(context, listen: true);
    pathReporter = geoLocalizationProvider!.pathFile;
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              title: Subtitle(title: 'Historial Viajes Finalizados'),
              subtitle: Text(
                  'Reporte con todos los viajes realizados por el usuario en formato NMEA (con fines investigativos).'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                OutlinedButton(
                  onPressed: () {
                    _generatedReport();
                  },
                  child: Text("Generar reporte", style: _getDefaultStyle()),
                ),
                OutlinedButton(
                  onPressed: () {
                    geoLocalizationProvider!.deleteHistory();
                  },
                  child: Text("Borrar historicos", style: _getDefaultStyle()),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
