import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapViewCurrentLocation extends StatefulWidget {
  const MapViewCurrentLocation({Key? key}) : super(key: key);

  @override
  _MapViewCurrentLocationState createState() => _MapViewCurrentLocationState();
}

class _MapViewCurrentLocationState extends State<MapViewCurrentLocation> {
  // For storing the current position
  Position? _currentPosition;

  Set<Marker> markers = {};

  // Initial location of the Map view
  final CameraPosition _initialLocation =
      const CameraPosition(target: LatLng(-0.225219, -78.5248), zoom: 10.0);
  // For controlling the view of the Map
  late GoogleMapController mapController;

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

    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      // Store the position in the variable
      _currentPosition = position;

      setState(() {
        // For moving the camera to current location
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
      });

      //await _getAddress();
    }).catchError((e) {});
  }

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

  @override
  void initState() {
    super.initState();
    _getCurrentLocation().then((value) => {_addMarket()});
  }

  ///initialCameraPosition : este es un parámetro obligatorio que se utiliza para cargar la vista del mapa en el inicio inicial.
  ///myLocationEnabled : para mostrar su ubicación actual en el mapa con un punto azul.
  ///myLocationButtonEnabled : este botón se utiliza para llevar la ubicación del usuario al centro de la vista de la cámara.
  ///mapType : Para especificar el tipo de mapa mostrado (normal, satelital, híbrido o terreno).
  ///zoomGesturesEnabled : si la vista del mapa debe responder a los gestos de zoom.
  ///zoomControlsEnabled : si mostrar controles de zoom (solo aplicable para Android).
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
}
