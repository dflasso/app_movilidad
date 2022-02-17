import 'package:flutter/material.dart';
import 'package:geo_espe_app_movilidad/src/model/section_model.dart';
import 'package:geo_espe_app_movilidad/src/providers/destienies_provider.dart';
import 'package:geo_espe_app_movilidad/src/repositories/section_repository.dart';
import 'package:provider/provider.dart';

class HeaderSummaryTravel extends StatelessWidget {
  const HeaderSummaryTravel({Key? key}) : super(key: key);

  BoxDecoration _getDefaultDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: const <BoxShadow>[
          BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(2.0, 10.0))
        ]);
  }

  @override
  Widget build(BuildContext context) {
    final destiniesProvider =
        Provider.of<DestiniesProvider>(context, listen: true);

    final SectionModel destinySelected =
        destiniesProvider.getDestinySelected() ?? getDefaultSection();

    final size = MediaQuery.of(context).size;

    return Container(
      decoration: _getDefaultDecoration(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: GestureDetector(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                height: size.height * 0.25,
                width: size.width * 0.55,
                placeholder: const AssetImage('assets/img/loading.gif'),
                image: const NetworkImage(
                    "https://upload.wikimedia.org/wikipedia/commons/3/3a/Logo_ESPEOk.png"),
                fit: BoxFit.cover,
                fadeInDuration: const Duration(milliseconds: 100),
              )),
        ),
      ),
    );
  }
}
