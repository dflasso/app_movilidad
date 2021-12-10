import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geo_espe_app_movilidad/src/components/subtitle.dart';
import 'package:geo_espe_app_movilidad/src/model/section_model.dart';
import 'package:geo_espe_app_movilidad/src/providers/destienies_provider.dart';
import 'package:geo_espe_app_movilidad/src/repositories/section_repository.dart';
import 'package:geo_espe_app_movilidad/src/theme/theme.dart';
import 'package:provider/provider.dart';

class DetailSummaryTravel extends StatelessWidget {
  const DetailSummaryTravel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final destiniesProvider =
        Provider.of<DestiniesProvider>(context, listen: true);

    final SectionModel destinySelected =
        destiniesProvider.getDestinySelected() ?? getDefaultSection();

    return Card(
        //color: Pallette.primary.light,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.info, color: Pallette.primary.dark),
              title: const Subtitle(title: "Destion"),
              subtitle: Text(destinySelected.description),
            ),
            ListTile(
              leading: Icon(Icons.business, color: Pallette.primary.dark),
              title: const Subtitle(title: "Piso: "),
              subtitle: Text(destinySelected.floor),
            ),
            ListTile(
              leading:
                  Icon(Icons.location_searching, color: Pallette.primary.dark),
              title: const Subtitle(title: "Indicaciones: "),
              subtitle: Text(destinySelected.indication),
            ),
          ],
        ));
  }
}
