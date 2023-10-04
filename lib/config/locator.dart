import 'package:food_delivery_app/repositories/places/places_repository.dart';
import 'package:food_delivery_app/repositories/places/places_repository_impl.dart';
import 'package:food_delivery_app/services/autocomplete/autocomplete_cubit.dart';
import 'package:food_delivery_app/services/places/place_cubit.dart';
import 'package:get_it/get_it.dart';

import '../repositories/geolocation/geolocation_repository.dart';
import '../repositories/geolocation/geolocation_repository_impl.dart';
import '../screens/location/bloc/location_cubit.dart';

GetIt get getIt => GetIt.instance;

abstract class Locator {
  static Future<void> init() async {
    await initRepositories();
    await initCubits();
  }

  static Future<void> initRepositories() async {
    getIt.registerSingleton<GeolocationRepository>(GeolocationRepositoryImpl());

    getIt.registerSingleton<PlacesRepository>(PlacesRepositoryImpl());
  }

  static Future<void> initCubits() async {
    getIt.registerSingleton<GeolocationCubit>(GeolocationCubit(getIt()));

    getIt.registerSingleton<AutocompleteCubit>(AutocompleteCubit(getIt()));

    getIt.registerSingleton<PlaceCubit>(PlaceCubit(getIt()));
  }
}
