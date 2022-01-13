import 'package:flutter/widgets.dart';
import 'package:geo_espe_app_movilidad/src/theme/colors/pallette.dart';

///Widget Genertico que despliega Titulos de nivel 1
class Subtitle extends StatelessWidget {
  final String title;
  final TextStyle? style;

  const Subtitle({required this.title, this.style, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: AlignmentDirectional.centerStart,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Text(
          title,
          style: style ?? _getDefaultStyle(),
        ));
  }

  TextStyle _getDefaultStyle() {
    return TextStyle(
        color: Pallette.primary.dark,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontSize: 18);
  }
}
