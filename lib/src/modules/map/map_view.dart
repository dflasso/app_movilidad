import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geo_espe_app_movilidad/src/providers/destienies_provider.dart';
import 'package:geo_espe_app_movilidad/src/providers/points_provider.dart';
import 'package:geo_espe_app_movilidad/src/repositories/secrets.dart';
import 'package:geo_espe_app_movilidad/src/repositories/section_repository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  // For storing the current position
  Position? _currentPosition;

  Set<Marker> markers = {};

  double destinationLatitude = -0.315039;

  double destinationLongitude = -78.445463;

  // Object for PolylinePoints
  late PolylinePoints polylinePoints;

// List of coordinates to join
  List<LatLng> polylineCoordinates = [];

// Map storing polylines created by connecting two points
  Map<PolylineId, Polyline> polylines = {};

  // Initial location of the Map view
  final CameraPosition _initialLocation =
      const CameraPosition(target: LatLng(-0.225219, -78.5248), zoom: 10.0);
  // For controlling the view of the Map
  late GoogleMapController mapController;

  DestiniesProvider? destiniesProvider;

  PointsProvider? pointsProvider;

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
      setState(() {
        // Store the position in the variable
        _currentPosition = position;
        // For moving the camera to current location
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 10.0,
            ),
          ),
        );
      });
      _addMarketOrigin();
      //await _getAddress();
    }).catchError((e) {});
  }

  void _addMarketOrigin() {
    double startLatitude = _currentPosition!.latitude;

    double startLongitude = _currentPosition!.longitude;

    String startCoordinatesString = '($startLatitude, $startLongitude)';

    // Start Location Marker
    Marker startMarker = Marker(
      markerId: MarkerId(startCoordinatesString),
      position: LatLng(startLatitude, startLongitude),
      infoWindow: InfoWindow(
        title: 'Origen $startCoordinatesString',
        snippet: "Origen",
      ),
      icon: BitmapDescriptor.defaultMarker,
    );

    String destinyCoordinatesString =
        '($destinationLatitude, $destinationLongitude)';

    // Start Location Marker
    Marker endMarker = Marker(
      markerId: MarkerId(destinyCoordinatesString),
      position: LatLng(destinationLatitude, destinationLongitude),
      infoWindow: InfoWindow(
        title: 'Destino $startCoordinatesString',
        snippet: "Destino",
      ),
      icon: BitmapDescriptor.defaultMarker,
    );

    setState(() {
      markers.add(startMarker);
      markers.add(endMarker);
    });
    // Adding the markers to the list
  }

  Future<void> _updateMapView() async {
    await _getCurrentLocation();

    if (_currentPosition != null) {
      double startLatitude = _currentPosition!.latitude;

      double startLongitude = _currentPosition!.longitude;

      // Calculating to check that the position relative
      // to the frame, and pan & zoom the camera accordingly.
      double miny = (startLatitude <= destinationLatitude)
          ? startLatitude
          : destinationLatitude;
      double minx = (startLongitude <= destinationLongitude)
          ? startLongitude
          : destinationLongitude;
      double maxy = (startLatitude <= destinationLatitude)
          ? destinationLatitude
          : startLatitude;
      double maxx = (startLongitude <= destinationLongitude)
          ? destinationLongitude
          : startLongitude;

      double southWestLatitude = miny;
      double southWestLongitude = minx;

      double northEastLatitude = maxy;
      double northEastLongitude = maxx;

      await _createPolylines(startLatitude, startLongitude, destinationLatitude,
          destinationLongitude);

      setState(() {
        // Accommodate the two locations within the
        // camera view of the map
        mapController.animateCamera(
          CameraUpdate.newLatLngBounds(
            LatLngBounds(
              northeast: LatLng(northEastLatitude, northEastLongitude),
              southwest: LatLng(southWestLatitude, southWestLongitude),
            ),
            100.0,
          ),
        );
      });
    }
  }

  // Create the polylines for showing the route between two places
  Future<void> _createPolylines(
    double startLatitude,
    double startLongitude,
    double destinationLatitude,
    double destinationLongitude,
  ) async {
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      Secrets.API_KEY, // Google Maps API Key
      PointLatLng(startLatitude, startLongitude),
      PointLatLng(destinationLatitude, destinationLongitude),
      travelMode: TravelMode.transit,
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }

    PolylineId id = PolylineId('1');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinates,
      width: 3,
    );

    polylines[id] = polyline;
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  ///initialCameraPosition : este es un parámetro obligatorio que se utiliza para cargar la vista del mapa en el inicio inicial.
  ///myLocationEnabled : para mostrar su ubicación actual en el mapa con un punto azul.
  ///myLocationButtonEnabled : este botón se utiliza para llevar la ubicación del usuario al centro de la vista de la cámara.
  ///mapType : Para especificar el tipo de mapa mostrado (normal, satelital, híbrido o terreno).
  ///zoomGesturesEnabled : si la vista del mapa debe responder a los gestos de zoom.
  ///zoomControlsEnabled : si mostrar controles de zoom (solo aplicable para Android).
  @override
  Widget build(BuildContext context) {
    destiniesProvider = Provider.of<DestiniesProvider>(context, listen: true);

    pointsProvider = Provider.of<PointsProvider>(context, listen: true);

    pointsProvider!.destiny =
        destiniesProvider!.getDestinySelected() ?? getDefaultSection();

    return Stack(
      children: <Widget>[
        GoogleMap(
          polylines: Set<Polyline>.of(polylines.values),
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
        ),
        // Show zoom buttons
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipOval(
                  child: Material(
                    color: Colors.blue.shade100, // button color
                    child: InkWell(
                      splashColor: Colors.blue, // inkwell color
                      child: const SizedBox(
                        width: 50,
                        height: 50,
                        child: Icon(Icons.directions),
                      ),
                      onTap: () {
                        setState(() {
                          if (markers.isNotEmpty) markers.clear();
                          if (polylines.isNotEmpty) polylines.clear();
                          if (polylineCoordinates.isNotEmpty) {
                            polylineCoordinates.clear();
                          }
                        });
                        _updateMapView();
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ClipOval(
                  child: Material(
                    color: Colors.blue.shade100, // button color
                    child: InkWell(
                      splashColor: Colors.blue, // inkwell color
                      child: const SizedBox(
                        width: 50,
                        height: 50,
                        child: Icon(Icons.volume_up),
                      ),
                      onTap: () {},
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
