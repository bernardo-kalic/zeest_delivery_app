import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/repositories/places/places_repository.dart';
import 'package:food_delivery_app/services/autocomplete/autocomplete_state.dart';

class AutocompleteCubit extends Cubit<AutocompleteState> {
  final PlacesRepository repository;

  AutocompleteCubit(this.repository) : super(InitialAutocompleteState());

  void getPlaces(String searchInput) async {
    emit(Autocompleteloading());
    final autocomplete = await repository.getAutocomplete(searchInput);
    emit(Autocompleteloaded(autocomplete: autocomplete));
  }
}
