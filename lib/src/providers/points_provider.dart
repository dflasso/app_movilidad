import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';
import 'package:geo_espe_app_movilidad/src/model/point_model.dart';
import 'package:geo_espe_app_movilidad/src/model/section_model.dart';
import 'package:geo_espe_app_movilidad/src/repositories/point_repository.dart';

class PointsProvider extends ChangeNotifier {
  SectionModel? destinySelected;
  List<PointModel> _points = <PointModel>[];

  PointsProvider({this.destinySelected}) {
    _loadPointsDefault();
  }

  _loadPointsDefault() async {
    final String response =
        await rootBundle.loadString('assets/data/points.json');
    _points = pointModelLtsFromJson(response);
  }

  set destiny(SectionModel _destinySelected) {
    destinySelected = _destinySelected;
  }

  PointModel get pointDestinySelected {
    PointModel point = PointModel(
        idPoint: "P0100",
        coordUtmEast: "784346.550817",
        coordUtmNorth: "9965143.84086",
        latitude: "-0.315039",
        length: "-78.445463");

    if (destinySelected != null) {
      for (var element in _points) {
        if (element.idPoint == destinySelected!.point.first) {
          point = element;
        }
      }
    }

    return point;
  }
}
