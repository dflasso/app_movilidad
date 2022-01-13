import 'package:flutter/widgets.dart';
import 'package:geo_espe_app_movilidad/src/modules/settings/reports.dart';

class ContentSettings extends StatelessWidget {
  const ContentSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(10.0),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[const Reports()]),
          )
        ],
      ),
    );
  }
}
