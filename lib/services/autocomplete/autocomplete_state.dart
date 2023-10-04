import 'package:food_delivery_app/models/place_autocomplete_model.dart';

abstract class AutocompleteState {}

class InitialAutocompleteState extends AutocompleteState {}

class Autocompleteloading extends AutocompleteState {}

class Autocompleteloaded extends AutocompleteState {
  final List<PlaceAutocomplete> autocomplete;

  Autocompleteloaded({required this.autocomplete});
}

class AutocompleteError extends AutocompleteState {}
