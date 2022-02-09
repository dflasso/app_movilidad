import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:geo_espe_app_movilidad/src/theme/theme.dart';

class NavigatorBarGeneric extends StatefulWidget {
  final int selectedIndex;
  const NavigatorBarGeneric({required this.selectedIndex, Key? key})
      : super(key: key);

  @override
  _NavigatorBarGenericState createState() => _NavigatorBarGenericState();
}

class _NavigatorBarGenericState extends State<NavigatorBarGeneric> {
  final AudioCache audioCache = AudioCache();
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    switch (index) {
      case 0:
        audioCache.play("sounds/seleccion_destino.mp3");
        Navigator.pushNamed(context, "destiny");
        break;
      case 1:
        audioCache.play("sounds/ubicacion_actual.mp3");
        Navigator.pushNamed(context, "current_location");
        break;
      case 2:
        audioCache.play("sounds/configuraciones.mp3");
        Navigator.pushNamed(context, "settings");
        break;
      default:
        audioCache.play("sounds/seleccion_destino.mp3");
        Navigator.pushNamed(context, "destiny");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Pallette.primary.dark,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on),
          label: 'Ubicación',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Configuraciones',
        )
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Pallette.secondary.main,
      unselectedItemColor: Pallette.primary.light,
      onTap: _onItemTapped,
    );
  }
}
