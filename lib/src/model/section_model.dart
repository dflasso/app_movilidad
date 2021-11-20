// To parse this JSON data, do
//
//     final sectionModel = sectionModelFromJson(jsonString);

class SectionModel {
  SectionModel(
      {required this.idSection,
      required this.description,
      required this.floor,
      required this.indication,
      required this.point,
      required this.parentSection,
      required this.image});

  String idSection;
  String description;
  String floor;
  String indication;
  String point;
  String parentSection;
  String image;

  factory SectionModel.fromJson(Map<String, dynamic> json) => SectionModel(
        idSection: json["idSection"] ?? "",
        description: json["description"] ?? "",
        floor: json["floor"] ?? "",
        indication: json["indication"] ?? "",
        point: json["point"] ?? "",
        parentSection: json["ParentSection"] ?? "",
        image: json["image"] ??
            "https://www.universidades.com.ec/logos/original/logo-universidad-de-las-fuerzas-armadas.png",
      );

  Map<String, dynamic> toJson() => {
        "idSection": idSection,
        "description": description,
        "floor": floor,
        "indication": indication,
        "point": point,
        "ParentSection": parentSection,
        "image": image
      };
}
