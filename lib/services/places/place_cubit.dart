import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/repositories/places/places_repository.dart';

import 'place_state.dart';

class PlaceCubit extends Cubit<PlaceState> {
  final PlacesRepository repository;

  PlaceCubit(this.repository) : super(InitialPlace());

  void getPlaces(String placeId) async {
    emit(Placeloading());
    final place = await repository.getPlace(placeId);
    emit(Placeloaded(place: place));
  }
}
