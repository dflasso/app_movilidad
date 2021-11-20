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
