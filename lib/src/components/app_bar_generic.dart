import 'package:flutter/material.dart';
import 'package:geo_espe_app_movilidad/src/theme/theme.dart';

class AppBarGeneric extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const AppBarGeneric({required this.title, Key? key}) : super(key: key);

  TextStyle _getDefaultStyle() {
    return TextStyle(
        color: Pallette.primary.contrastText,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        fontSize: 20);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: _getDefaultStyle(),
      ),
      backgroundColor: Pallette.primary.dark,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
