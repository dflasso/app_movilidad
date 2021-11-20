import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';

import 'package:geo_espe_app_movilidad/src/model/section_model.dart';
import 'package:geo_espe_app_movilidad/src/repositories/section_repository.dart';

class DestiniesProvider extends ChangeNotifier {
  List<SectionModel> _destinies = [];

  DestiniesProvider() {
    //Carga los destinos por defecto en la APP
    _loadDestiniesDefault();
  }

  _loadDestiniesDefault() async {
    final String response =
        await rootBundle.loadString('assets/data/sections.json');
    _destinies = sectionModelLtsFromJson(response);
    notifyListeners();
  }

  List<SectionModel> getDestinies() {
    return _destinies;
  }
}
