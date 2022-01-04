---
title: "Summary Trip"
metaTitle: "This is screen show a little summary of trip"
metaDescription: "This is the meta description"
---

# Description

This feature basically show a little summary of trip, and save generate a log of final location in NMEA.

# Screen 


The screen only call **ContentScreemSumaryTravel** Widget

See all code of screen in [github](https://github.com/dflasso/app_movilidad/blob/3-maps-routes/lib/src/screens/summary_travel_screen.dart).

# Custom Widgets 

## Widget with feactures
- [content_summary_travel.dart](https://github.com/dflasso/app_movilidad/blob/3-maps-routes/lib/src/modules/summary_travel/content_summary_travel.dart)

The next widget do the next features:
1. Get Destiny selected previously.
```dart
    final destiniesProvider =
        Provider.of<DestiniesProvider>(context, listen: true);

    return destiniesProvider.getDestinySelected() ?? getDefaultSection();
```
2. Enable Assistant Voice
```dart
  void playAudioTripFinished(SectionModel destinySelected) {
    final AudioCache audioCache = AudioCache();
    audioCache.play(destinySelected.soundTripFinished);
  }
```

3. Get Current Locartion
```dart
  void getCurrentLocation() async {
    final geoLocalizationProvider =
        Provider.of<GeoLocalizationProvider>(context);
    verifyServiceEnable();
    verifyPermissonsLocalization();
    LocationData locationData = await locationDevice.getLocation();
    geoLocalizationProvider.addNewTripLog(locationData);
  }
```
See all code of widget on [github](https://github.com/dflasso/app_movilidad/blob/3-maps-routes/lib/src/modules/summary_travel/content_summary_travel.dart)

## Widgets that only render
The next widgets render information about the trip
- [detail_summary_travel.dart](https://github.com/dflasso/app_movilidad/blob/3-maps-routes/lib/src/modules/summary_travel/detail_summary_travel.dart)
- [header_summary_travel.dart](https://github.com/dflasso/app_movilidad/blob/3-maps-routes/lib/src/modules/summary_travel/header_summary_travel.dart)

# Utils
Before to save in cache the final location the application generate log with Standar NMEA

# References
- [Oliver Petrovski](https://github.com/opetrovski) (2017), NMEA Generator in Java. Available in [link](https://github.com/opetrovski/NMEA-Generator/blob/master/src/main/java/generator/nmea/GPS.java)