import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:geo_espe_app_movilidad/src/model/point_model.dart';

const String pointsDefault = "assets/data/points.json";

List<PointModel> pointModelLtsFromJson(String str) =>
    List<PointModel>.from(json.decode(str).map((x) => PointModel.fromJson(x)));

String pointLtsModelToJson(List<PointModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

PointModel pointModelFromJson(String str) =>
    PointModel.fromJson(json.decode(str));

String pointModelToJson(PointModel data) => json.encode(data.toJson());

Future<List<PointModel>> getPointsFromAssets() async {
  String response = await rootBundle.loadString(pointsDefault);

  return pointModelLtsFromJson(response);
}

List<PointModel> findByIdPoint(List<PointModel> points, String idPoint) {
  if (points.isEmpty) {
    return <PointModel>[];
  }

  return points.where((element) => element.idPoint == idPoint).toList();
}
