import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/screens/location/bloc/location_state.dart';

import '../../../repositories/geolocation/geolocation_repository.dart';

class GeolocationCubit extends Cubit<GeolocationState> {
  final GeolocationRepository repository;

  GeolocationCubit(this.repository) : super(InitialGeolocationState());

  void getCurrentPosition() async {
    try {
      emit(GeolocationLoading());
      final position = await repository.getCurrentLocation();
      emit(GeolocationLoaded(position: position!));
    } catch (e) {
      emit(GeolocationError());
    }
  }
}
