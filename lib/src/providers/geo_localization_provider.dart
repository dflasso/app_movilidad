import 'package:flutter/widgets.dart';
import 'package:geo_espe_app_movilidad/src/model/trip_log_model.dart';
import 'package:geo_espe_app_movilidad/src/repositories/file_manager.dart';
import 'package:geo_espe_app_movilidad/src/repositories/local_storage_repository.dart';
import 'package:location/location.dart';

const String nameFile = "logs_locations.txt";

class GeoLocalizationProvider extends ChangeNotifier {
  final FileManager _fileManager = FileManager();

  final LocalStorageRepository _localStorageRepository =
      LocalStorageRepository();

  String pathFile = "";

  List<LocationData>? historyTripsFinished;

  GeoLocalizationProvider({this.historyTripsFinished}) {
    historyTripsFinished ??= <LocationData>[];
    _fileManager.getUri().then((pathCreated) => pathFile = pathCreated);
  }

  void addNewTripLog(LocationData locationData) {
    historyTripsFinished!.add(locationData);
    _localStorageRepository.saveNewItemInHistoryTripsFinished(locationData);
  }

  void testData() {
    _localStorageRepository.getAllItemsHistoryTripsFinished();
  }

  Future<String> createFileWithItemsHistoryTripsFinished() async {
    DateTime now = DateTime.now();
    String nameFile = now.toIso8601String();
    nameFile = nameFile.replaceAll(":", "-");
    nameFile = nameFile.replaceAll(".", "-");
    nameFile = 'logs_trips_$nameFile.txt';
    List<TripLog> trips =
        await _localStorageRepository.getAllItemsHistoryTripsFinished();

    String fileContent = "";

    for (var trip in trips) {
      fileContent = fileContent + trip.toNmea();
    }

    //await _fileManager.writeFile(nameFile, fileContent);

    return fileContent;
  }

  deleteHistory() {
    historyTripsFinished = <LocationData>[];
    _localStorageRepository.deleteAll();
  }
}
