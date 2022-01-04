---
title: "Selection Destiny"
metaTitle: "This is page show how choose  user the destiny"
metaDescription: "voice asintance, read json"
---
# Description

This feature basically show all destinies. If the user touch the destiny the asintace voice said the name of place, else if user double touch the screen it search sub destinies or show map view.

# Screen 

This [Screen](https://github.com/dflasso/app_movilidad/blob/3-maps-routes/lib/src/screens/destiny_screen.dart) basiclly show many destinies in a carousel. 

With the next code, the screen can check if show parent destinies of sub destinies.

```dart
    if (ModalRoute.of(context) != null) {
      if (ModalRoute.of(context)!.settings.arguments != null) {
        Map<String, String> arguments =
            ModalRoute.of(context)!.settings.arguments as Map<String, String>;
        grSectionsTarget = arguments['parentSection'] ?? "-";
      }
    }
```

See all code of screen in [github](https://github.com/dflasso/app_movilidad/blob/3-maps-routes/lib/src/screens/destiny_screen.dart).

# Custom Widgets 

This screen have used the next custom widgets:

### Widget ListDestinies.dart

With the next code,  the widget try to get all destinies by id of parent  destiny.

```dart
    destiniesProvider.getFilterDestinies(widget.parentSection ?? "-")
```

See all code of widget in [github](hhttps://github.com/dflasso/app_movilidad/blob/3-maps-routes/lib/src/modules/destiny/ListDestinies.dart).

###  Widget destiny_selected.dart

With the next code,  the widget try to get sub destinies or show map view.

```dart
    ///Search if the selected destination has sub-destinations
    List<SectionModel> subSections =
        destiniesProvider.getFilterDestinies(destiny.idSection);

    ///If the destination does not have a sub-destination, the user is directed to the map
    if (subSections.isEmpty) {
    destiniesProvider.setDestinySelected(destiny);
    Navigator.pushNamed(context, "map");
    } else {
    ///If the destination has its destination, the available sub-destinations are displayed
    Navigator.pushNamed(context, "destiny",
        arguments: <String, String>{
            "parentSection": destiny.idSection
        });
    }
```
See all code of widget in [github](https://github.com/dflasso/app_movilidad/blob/3-maps-routes/lib/src/screens/destiny_screen.dart).

# Pluggins

This screen have used the next plugin:
- [card_swiper](https://pub.dev/packages/card_swiper)