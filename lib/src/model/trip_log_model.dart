// To parse this JSON data, do
//
//     final tripLog = tripLogFromJson(jsonString);

import 'dart:convert';
import 'package:geo_espe_app_movilidad/src/util/nmea_generator.dart';
import 'package:location/location.dart';

TripLog tripLogFromJson(String str) => TripLog.fromJson(json.decode(str));

String tripLogToJson(TripLog data) => json.encode(data.toJson());

class TripLog {
  TripLog({
    this.id,
    required this.latitude,
    required this.longitude,
    required this.accuracy,
    required this.altitude,
    required this.speed,
    required this.speedAccuracy,
    required this.heading,
    required this.time,
    required this.isMock,
    required this.verticalAccuracy,
    required this.headingAccuracy,
    required this.elapsedRealtimeNanos,
    required this.elapsedRealtimeUncertaintyNanos,
    required this.satelliteNumber,
    required this.provider,
  });

  String? id;
  double latitude;
  double longitude;
  double accuracy;
  double altitude;
  double speed;
  double speedAccuracy;
  double heading;
  double time;
  bool isMock;
  double verticalAccuracy;
  double headingAccuracy;
  double elapsedRealtimeNanos;
  double elapsedRealtimeUncertaintyNanos;
  double satelliteNumber;
  String provider;

  factory TripLog.fromJson(Map<String, dynamic> json) => TripLog(
        id: json["id"] ?? "-",
        latitude: json["latitude"] ?? 0.0,
        longitude: json["longitude"] ?? 0.0,
        accuracy: json["accuracy"] ?? 0.0,
        altitude: json["altitude"] ?? 0.0,
        speed: json["speed"] ?? 0.0,
        speedAccuracy: json["speed_accuracy"] ?? 0.0,
        heading: json["heading"] ?? 0.0,
        time: json["time"] ?? 0.0,
        isMock: (json["isMock"] == 1) ? true : false,
        verticalAccuracy: json["verticalAccuracy"] ?? 0.0,
        headingAccuracy: json["headingAccuracy"] ?? 0.0,
        elapsedRealtimeNanos: json["elapsedRealtimeNanos"] ?? 0.0,
        elapsedRealtimeUncertaintyNanos:
            json["elapsedRealtimeUncertaintyNanos"] ?? 0.0,
        satelliteNumber: (json["satelliteNumber"] is int)
            ? json["satelliteNumber"].toDouble()
            : json["satelliteNumber"],
        provider: json["provider"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "latitude": latitude,
        "longitude": longitude,
        "accuracy": accuracy,
        "altitude": altitude,
        "speed": speed,
        "speed_accuracy": speedAccuracy,
        "heading": heading,
        "time": time,
        "isMock": isMock,
        "verticalAccuracy": verticalAccuracy,
        "headingAccuracy": headingAccuracy,
        "elapsedRealtimeNanos": elapsedRealtimeNanos,
        "elapsedRealtimeUncertaintyNanos": elapsedRealtimeUncertaintyNanos,
        "satelliteNumber": satelliteNumber,
        "provider": provider,
      };

  String toNmea() {
    NmeaGenerator nmeaGenerator = NmeaGenerator(tripLog: this);
    return nmeaGenerator.generate();
  }

  static Map<String, dynamic> buildFromLocationData(LocationData locationData) {
    return <String, dynamic>{
      "latitude": locationData.latitude ?? 0.0,
      "longitude": locationData.longitude ?? 0.0,
      "accuracy": locationData.accuracy ?? 0.0,
      "altitude": locationData.altitude ?? 0.0,
      "speed": locationData.speed ?? 0.0,
      "speed_accuracy": locationData.speedAccuracy ?? 0.0,
      "heading": locationData.heading ?? 0.0,
      "time": locationData.time ?? 0.0,
      "isMock": (locationData.isMock == true) ? 1 : 0,
      "verticalAccuracy": locationData.verticalAccuracy ?? 0.0,
      "headingAccuracy": locationData.headingAccuracy ?? 0.0,
      "elapsedRealtimeNanos": locationData.elapsedRealtimeNanos ?? 0.0,
      "elapsedRealtimeUncertaintyNanos":
          locationData.elapsedRealtimeUncertaintyNanos ?? 0.0,
      "satelliteNumber": locationData.satelliteNumber ?? 0.0,
      "provider": locationData.provider ?? "",
    };
  }
}
