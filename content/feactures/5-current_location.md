---
title: "Current Location"
metaTitle: "This is screen show map with current location"
metaDescription: "google-apis, google-maps"
---


# Description

This feature basically show the current location of user.

# Screen 

The screen only call **MapViewCurrentLocation** Widget

See all code of screen in [github](https://github.com/dflasso/app_movilidad/blob/3-maps-routes/lib/src/screens/current_location.dart).

# Custom Widgets 

### MapViewCurrentLocation
Steps for show current location with google maps:

1. Get Current Location
```dart
Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied.');
      }
}
```
2. Add Market of Current Location
```dart
void _addMarket() {
    double startLatitude = _currentPosition!.latitude;

    double startLongitude = _currentPosition!.longitude;

    String startCoordinatesString = '($startLatitude, $startLongitude)';

    // Start Location Marker
    Marker startMarker = Marker(
      markerId: MarkerId(startCoordinatesString),
      position: LatLng(startLatitude, startLongitude),
      infoWindow: InfoWindow(
        title: 'Start $startCoordinatesString',
        snippet: "test",
      ),
      icon: BitmapDescriptor.defaultMarker,
    );

    setState(() {
      markers.add(startMarker);
    });
    // Adding the markers to the list
}
```
3. Show Map

```dart
@override
Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          markers: Set<Marker>.from(markers),
          initialCameraPosition: _initialLocation,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          zoomGesturesEnabled: true,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller) {
            mapController = controller;
          },
        )
      ],
    );
}
```

# Pluggins
- [google_maps_flutter](https://pub.dev/packages/google_maps_flutter)
- [geolocator](https://pub.dev/packages/geolocator)
