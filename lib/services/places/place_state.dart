import 'package:food_delivery_app/models/place_model.dart';

abstract class PlaceState {}

class InitialPlace extends PlaceState {}

class Placeloading extends PlaceState {}

class Placeloaded extends PlaceState {
  final Place place;

  Placeloaded({required this.place});
}

class PlaceError extends PlaceState {}
