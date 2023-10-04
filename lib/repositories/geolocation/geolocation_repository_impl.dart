import 'package:food_delivery_app/repositories/geolocation/geolocation_repository.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationRepositoryImpl extends GeolocationRepository {
  GeolocationRepositoryImpl();

  @override
  Future<Position?> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
