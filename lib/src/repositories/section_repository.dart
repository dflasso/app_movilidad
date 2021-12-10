import 'dart:convert';
import 'package:geo_espe_app_movilidad/src/model/section_model.dart';

List<SectionModel> sectionModelLtsFromJson(String str) =>
    List<SectionModel>.from(
        json.decode(str).map((x) => SectionModel.fromJson(x)));

String sectionModelLtsToJson(List<SectionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

SectionModel sectionModelFromJson(String str) =>
    SectionModel.fromJson(json.decode(str));

String sectionModelToJson(SectionModel data) => json.encode(data.toJson());

List<SectionModel> findByIdSection(
    List<SectionModel> sections, String idSection) {
  if (sections.isEmpty) {
    return <SectionModel>[];
  }
  return sections.where((element) => element.idSection == idSection).toList();
}

List<SectionModel> filterSection(
    List<SectionModel> sections, String parentSection) {
  return sections
      .where((element) => element.parentSection == parentSection)
      .toList();
}

SectionModel getDefaultSection() {
  return SectionModel(
      idSection: "xx",
      description: "Error al obtener datos del destino",
      floor: "-",
      indication: "-",
      point: ["x"],
      parentSection: "x",
      image: "https://via.placeholder.com/400x300",
      sound: "sounds/destino_desconocido.mp3",
      soundTripFinished: "sounds/viaje_finalizado.mp3",
      hasOtherOption: false);
}
