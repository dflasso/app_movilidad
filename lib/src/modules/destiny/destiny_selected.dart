import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';
import 'package:geo_espe_app_movilidad/src/components/title_level1.dart';
import 'package:geo_espe_app_movilidad/src/model/section_model.dart';
import 'package:geo_espe_app_movilidad/src/providers/destienies_provider.dart';
import 'package:provider/provider.dart';

class DestinySelected extends StatelessWidget {
  final SectionModel destiny;
  const DestinySelected({required this.destiny, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final destiniesProvider =
        Provider.of<DestiniesProvider>(context, listen: true);

    final size = MediaQuery.of(context).size;

    final AudioCache audioCache = AudioCache();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TitleLevel1(title: destiny.description),
        GestureDetector(
            onTap: () => audioCache.play(destiny.sound),
            onDoubleTap: () {
              ///Busca si el destino seleccionado tiene subdestinos
              List<SectionModel> subSections =
                  destiniesProvider.getFilterDestinies(destiny.idSection);

              ///Si el destino no tiene subdestino se direcciona al usuario al mapa
              if (subSections.isEmpty) {
                destiniesProvider.setDestinySelected(destiny);
                Navigator.pushNamed(context, "map");
              } else {
                ///Si el destino tiene subdestino se despliega los subdestinos disponibles
                Navigator.pushNamed(context, "destiny",
                    arguments: <String, String>{
                      "parentSection": destiny.idSection
                    });
              }
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                height: size.height * 0.70,
                width: size.width * 0.85,
                placeholder: const AssetImage('assets/img/loading.gif'),
                image: NetworkImage(destiny.image),
                fit: BoxFit.cover,
                fadeInDuration: const Duration(milliseconds: 100),
              ),
            ))
      ],
      mainAxisSize: MainAxisSize.max,
    );
  }
}
