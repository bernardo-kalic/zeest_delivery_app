import 'package:food_delivery_app/models/place_autocomplete_model.dart';

import '../../models/place_model.dart';

abstract class PlacesRepository {
  Future<List<PlaceAutocomplete>> getAutocomplete(String searchInput);
  Future<Place> getPlace(String placeId);
}
