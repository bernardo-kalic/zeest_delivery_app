import 'dart:convert' as convert;

import 'package:food_delivery_app/models/place_autocomplete_model.dart';
import 'package:food_delivery_app/repositories/places/places_repository.dart';
import 'package:http/http.dart' as http;

import '../../models/place_model.dart';

class PlacesRepositoryImpl extends PlacesRepository {
  final String key = 'AIzaSyBzeRNMt0kXiOsOk4LNle5B1AKDhgeRkF4';
  final String types = 'geocode';

  @override
  Future<List<PlaceAutocomplete>> getAutocomplete(String searchInput) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchInput&types=$types&key=$key';

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results = json['predictions'] as List;

    return results.map((place) => PlaceAutocomplete.fromJson(place)).toList();
  }

  @override
  Future<Place> getPlace(String placeId) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key';
    final response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var result = json['result'] as Map<String, dynamic>;

    return Place.fromJson(result);
  }
}
