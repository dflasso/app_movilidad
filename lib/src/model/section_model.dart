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
      required this.image,
      required this.sound,
      required this.hasOtherOption});

  String idSection;
  String description;
  String floor;
  String indication;
  List<String> point;
  String parentSection;
  String image;
  String sound;
  bool hasOtherOption;

  factory SectionModel.fromJson(Map<String, dynamic> json) => SectionModel(
      idSection: json["idSection"] ?? "",
      description: json["description"] ?? "",
      floor: json["floor"] ?? "",
      indication: json["indication"] ?? "",
      point: List<String>.from(json["point"].map((x) => x)),
      parentSection: json["ParentSection"] ?? "",
      image: json["image"] ??
          "https://www.universidades.com.ec/logos/original/logo-universidad-de-las-fuerzas-armadas.png",
      sound: json["sound"] ?? "sounds/destino_desconocido.mp3",
      hasOtherOption: json["hasOtherOption"] ?? false);

  Map<String, dynamic> toJson() => {
        "idSection": idSection,
        "description": description,
        "floor": floor,
        "indication": indication,
        "point": List<dynamic>.from(point.map((x) => x)),
        "ParentSection": parentSection,
        "image": image,
        "sound": sound,
        "hasOtherOption": hasOtherOption
      };
}
