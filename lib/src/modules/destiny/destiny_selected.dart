import 'package:flutter/widgets.dart';
import 'package:geo_espe_app_movilidad/src/model/section_model.dart';

class DestinySelected extends StatelessWidget {
  SectionModel destiny;
  DestinySelected({required this.destiny, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("data"),
    );
  }
}

// return GestureDetector(
//             onTap: () {
//               //ir a la siguiente pagina
//             },
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: FadeInImage(
//                 placeholder: const AssetImage('assets/img/loading.gif'),
//                 image: NetworkImage(destiny.image),
//                 fit: BoxFit.cover,
//                 fadeInDuration: const Duration(milliseconds: 200),
//               ),
//             ));
