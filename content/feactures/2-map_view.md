---
title: "Map View"
metaTitle: "This is screen show map view with route"
metaDescription: "arcgis, permisson, webview"
---

# Description

This feature basically show a Map with route to destin previously selected.

# Screen 

The screen only call **MapView** Widget

See all code of screen in [github](https://github.com/dflasso/app_movilidad/blob/3-maps-routes/lib/src/screens/map_screen.dart).

# Custom Widgets 

### MapView

Steps for show map and route:

1. Request permission to get current location
```dart
  void requestPermission() async {
    Map<Permission, PermissionStatus> statuses =
        await [Permission.location].request();
  }
```

2. Recovery destiny selected previously
```dart
    final destiniesProvider =
        Provider.of<DestiniesProvider>(context, listen: true);

    final pointsProvider = Provider.of<PointsProvider>(context, listen: true);

    pointsProvider.destiny =
        destiniesProvider.getDestinySelected() ?? getDefaultSection();

    PointModel pointSelected = pointsProvider.pointDestinySelected;
```
3. Show Map View
```dart
 url: Uri.parse(
              "https://app-movilidad-map.vercel.app/?destinationLatitude=${pointSelected.latitude}&destinationLongitude=${pointSelected.length}"))
```

4. Solve route to destiny selected previously
```javascript
    route.solve(routeUrl, routeParams).then((data) => {
    data.routeResults.forEach(function (result) {
        result.route.symbol = {
            type: "simple-line",
            color: [5, 150, 255],
            width: 3
        };
        view.graphics.add(result.route);
    });
    }).catch(function (error) {
        console.log(error);
    })
```

See all code of widget on [github](https://github.com/dflasso/app_movilidad/blob/3-maps-routes/lib/src/modules/map/map_view.dart)


See all code of solve route on [github](https://github.com/dflasso/app_movilidad_map/blob/main/middleware/arcgis.js)

# Pluggins
- [flutter_inappwebview](https://pub.dev/packages/flutter_inappwebview)

# References
- Arcgis. Find a route and directions. Available in [link](https://developers.arcgis.com/javascript/latest/find-a-route-and-directions/)