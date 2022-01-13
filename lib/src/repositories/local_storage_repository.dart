import 'package:geo_espe_app_movilidad/src/model/trip_log_model.dart';
import 'package:localstore/localstore.dart';
import 'package:location/location.dart';

class LocalStorageRepository {
  final _db = Localstore.instance;

  void saveNewItemInHistoryTripsFinished(LocationData locationData) {
    String id = _db.collection('historyTrips').doc().id;
    _db
        .collection('historyTrips')
        .doc(id)
        .set(TripLog.buildFromLocationData(locationData));
  }

  Future<List<TripLog>> getAllItemsHistoryTripsFinished() async {
    Map<String, dynamic>? items =
        await _db.collection('historyTrips').get() ?? <String, dynamic>{};
    List<TripLog> trips = <TripLog>[];

    for (var element in items.entries) {
      trips.add(TripLog.fromJson(element.value));
    }

    return trips;
  }

  Future<void> deleteAll() async {
    // Map<String, dynamic>? items =
    //     await _db.collection('historyTrips').get() ?? <String, dynamic>{};

    // for (var element in items.entries) {
    //   _db.collection('historyTrips').doc(element.value).delete();
    // }

    _db.collection('historyTrips').doc().delete();
  }
}
