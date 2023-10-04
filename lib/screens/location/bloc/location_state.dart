import 'package:geolocator/geolocator.dart';

abstract class GeolocationState {}

class InitialGeolocationState extends GeolocationState {}

class GeolocationLoading extends GeolocationState {}

class GeolocationLoaded extends GeolocationState {
  final Position position;

  GeolocationLoaded({required this.position});
}

class GeolocationError extends GeolocationState {}
