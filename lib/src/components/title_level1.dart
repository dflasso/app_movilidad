import 'package:flutter/widgets.dart';
import 'package:geo_espe_app_movilidad/src/theme/colors/pallette.dart';

///Widget Genertico que despliega Titulos de nivel 1
class TitleLevel1 extends StatelessWidget {
  final String title;
  final TextStyle? style;

  const TitleLevel1({required this.title, this.style, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: AlignmentDirectional.center,
        margin:
            const EdgeInsetsDirectional.only(bottom: 3.0, start: 5.0, end: 5.0),
        padding: const EdgeInsetsDirectional.all(1.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Text(
          title,
          style: style ?? _getDefaultStyle(),
        ));
  }

  TextStyle _getDefaultStyle() {
    return TextStyle(
        color: Pallette.primary.dark,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        fontSize: 20);
  }
}
