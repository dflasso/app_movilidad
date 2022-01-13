// To parse this JSON data, do
//
//     final pointModel = pointModelFromJson(jsonString);

class PointModel {
  PointModel({
    required this.idPoint,
    required this.coordUtmEast,
    required this.coordUtmNorth,
    required this.latitude,
    required this.length,
  });

  String idPoint;
  String coordUtmEast;
  String coordUtmNorth;
  String latitude;
  String length;

  factory PointModel.fromJson(Map<String, dynamic> json) => PointModel(
        idPoint: json["idPoint"] ?? "",
        coordUtmEast: json["coordUtmEast"] ?? "",
        coordUtmNorth: json["coordUtmNorth"] ?? "",
        latitude: json["latitude"] ?? "",
        length: json["length"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "idPoint": idPoint,
        "coordUtmEast": coordUtmEast,
        "coordUtmNorth": coordUtmNorth,
        "latitude": latitude,
        "length": length,
      };
}
