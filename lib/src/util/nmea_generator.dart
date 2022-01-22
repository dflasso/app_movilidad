import 'dart:typed_data';

import 'package:geo_espe_app_movilidad/src/model/trip_log_model.dart';
import 'package:intl/intl.dart';

///Clase que permite generar el formato NMEA
class NmeaGenerator {
  NmeaGenerator({required this.tripLog});

  TripLog tripLog;

  String generate() {
    String latitudeNmea = _toNmeaLatitudeFormat(tripLog.latitude);
    String latitudeDirection = _determinateDirectionLatitude(tripLog.latitude);

    String longitudeNmea = _toNmeaLongitudeFormat(tripLog.longitude);
    String longitudeDirection =
        _determinateDirectionLongitude(tripLog.longitude);

    /// a la hora del celular sumar 5
    /// obtener zona horario utc
    DateTime nowUtc =
        DateTime.fromMicrosecondsSinceEpoch(tripLog.time.round() * 1000);

    nowUtc = nowUtc.toUtc();

    String utcTime = DateFormat('HHmmss').format(nowUtc);

    String altitudeAsString = tripLog.altitude.toStringAsFixed(4);

    /// despues de latitud modo de funcionamiento = 1, #_satelites, 1 , altitud, M,,,,  checksum
    String gpgga =
        '''\$GPGGA,$utcTime,$latitudeNmea,$latitudeDirection,$longitudeNmea,$longitudeDirection,1,${tripLog.satelliteNumber},1,$altitudeAsString,M,,,,''';

    String cksum = _calculateChecksum(gpgga);
    gpgga = '''$gpgga$cksum''';

    return '''$gpgga\n''';
  }

  /// Calculate checksums for NMEA 0183 sentences. basically what you do
  /// is to XOR every byte starting from the second (the one after the "$")
  /// So - take the second byte, XOR with third, then XOR the result with fourth
  /// and so on until done. Return the two-digit hex value of the checksum.
  String _calculateChecksum(String data) {
    Uint8List array = Uint8List(data.length + 1);
    int cksum = array.elementAt(1);
    int one = cksum;
    int two = 0;
    int xor = 0;
    for (int i = 2; i < data.length; i++) {
      one = cksum;
      two = array.elementAt(i);
      xor = (one ^ two);
      cksum = (15 & xor);
    }
    return cksum.toRadixString(16);
  }

  String _determinateDirectionLongitude(double longitude) {
    if (longitude > 0) {
      return "E";
    } else {
      return "W";
    }
  }

  String _determinateDirectionLatitude(double latitude) {
    if (latitude > 0) {
      return "N";
    } else {
      return "S";
    }
  }

  ///Convert longitude from decimal degrees to the format expected in NMWEA 0183 sentences.
  /// sacar enteros -> grados (en 3 digitos 000 - 360)
  /// decimal * 60  (entero en dos digitos) , (decimales restantes)
  String _toNmeaLongitudeFormat(double longitude) {
    double longitudeValueAbs = (longitude).abs();
    double longitudeDecimals = longitudeValueAbs - longitudeValueAbs.round();

    /// Calculate minutes
    double minutes = longitudeDecimals * 60.0;
    String minutesAsString = minutes.toStringAsFixed(6);
    if (minutes < 10) {
      minutesAsString = '0$minutesAsString';
    }

    /// Calculate degree
    int degree = longitudeValueAbs.round();
    String degreeAsString = degree.toString();
    if (degree < 100 && degree > 9) {
      degreeAsString = '0$degree';
    } else if (degree < 10) {
      degreeAsString = '00$degree';
    }

    String nmeaLongitude = degreeAsString + minutesAsString;

    return nmeaLongitude;
  }

  ///Convert latitude from decimal degrees to the format expected in NMWEA 0183 sentences.
  /// sacar enteros -> grados (en 3 digitos 00 - 90)
  /// decimal * 60  (entero en dos digitos) , (decimales restantes)
  ///
  String _toNmeaLatitudeFormat(double latitude) {
    double latitudeValueAbs = (latitude).abs();
    double longitudeDecimals = latitudeValueAbs - latitudeValueAbs.round();

    /// Calculate minutes
    double minutes = longitudeDecimals * 60.0;
    String minutesAsString = minutes.toString();
    if (minutes < 10) {
      minutesAsString = '0$minutesAsString';
    }

    /// Calculate degree
    int degree = longitudeDecimals.round();
    String degreeAsString = degree.toString();
    if (degree < 10) {
      degreeAsString = '0$degree';
    }

    String nmeaLatitud = degreeAsString + minutesAsString;
    return nmeaLatitud;
  }
}
