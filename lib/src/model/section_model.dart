const _imageDefault = "assets/img/loading.gif";
const _soundSectionDefault = "sounds/destino_desconocido.mp3";
const _soundTripFinishedDefault = "sounds/viaje_finalizado.mp3";

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
      required this.hasOtherOption,
      required this.soundTripFinished});

  String idSection;
  String description;
  String floor;
  String indication;
  List<String> point;
  String parentSection;
  String image;
  String sound;
  String soundTripFinished;
  bool hasOtherOption;

  factory SectionModel.fromJson(Map<String, dynamic> json) => SectionModel(
        idSection: json["idSection"] ?? "",
        description: json["description"] ?? "",
        floor: json["floor"] ?? "",
        indication: json["indication"] ?? "",
        point: List<String>.from(json["point"].map((x) => x)),
        parentSection: json["ParentSection"] ?? "",
        image: json["image"] ?? _imageDefault,
        sound: json["sound"] ?? _soundSectionDefault,
        soundTripFinished:
            json["soundTripFinished"] ?? _soundTripFinishedDefault,
        hasOtherOption: json["hasOtherOption"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "idSection": idSection,
        "description": description,
        "floor": floor,
        "indication": indication,
        "point": List<dynamic>.from(point.map((x) => x)),
        "ParentSection": parentSection,
        "image": image,
        "sound": sound,
        "hasOtherOption": hasOtherOption,
        "soundTripFinished": soundTripFinished
      };
}
