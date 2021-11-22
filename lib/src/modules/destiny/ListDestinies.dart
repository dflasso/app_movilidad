import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geo_espe_app_movilidad/src/model/section_model.dart';
import 'package:geo_espe_app_movilidad/src/providers/destienies_provider.dart';

import 'package:provider/provider.dart';

class ListDestinies extends StatelessWidget {
  String? parentSection;

  ListDestinies({this.parentSection, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final destiniesProvider =
        Provider.of<DestiniesProvider>(context, listen: true);

    final size = MediaQuery.of(context).size;

    return Center(
        child: Swiper(
      itemWidth: size.width * 0.8,
      itemHeight: size.height * 0.6,
      itemCount:
          destiniesProvider.getFilterDestinies(parentSection ?? "-").length,
      layout: SwiperLayout.STACK,
      itemBuilder: (context, int index) {
        SectionModel destiny =
            destiniesProvider.getFilterDestinies(parentSection ?? "-")[index];

        return GestureDetector(
            onTap: () {
              //ir a la siguiente pagina
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/img/loading.gif'),
                image: NetworkImage(destiny.image),
                fit: BoxFit.cover,
                fadeInDuration: const Duration(milliseconds: 200),
              ),
            ));
      },
    ));
  }
}
