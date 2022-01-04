---
title: "Report Trips"
metaTitle: "This is screen show all settings aviable in app"
metaDescription: "send mail"
---


# Description
This is screen show all settings aviable in app

# Screen 
The screen only call **ContentSettings** Widget

See all code of screen in [github](https://github.com/dflasso/app_movilidad/blob/3-maps-routes/lib/src/screens/settings_screen.dart).

# Custom Widgets 
## Widget with feactures
- [report_destinies_finished.dart](https://github.com/dflasso/app_movilidad/blob/3-maps-routes/lib/src/modules/settings/report_destinies_finished.dart)

Get logs of trips and send report:
```dart
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
```

## Widgets that only render
The next widgets render information about the trip
- [main_content.dart](https://github.com/dflasso/app_movilidad/blob/3-maps-routes/lib/src/modules/settings/main_content.dart)
- [reports.dart](https://github.com/dflasso/app_movilidad/blob/3-maps-routes/lib/src/modules/settings/reports.dart)



# Pluggins

# References