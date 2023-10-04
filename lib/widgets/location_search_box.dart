import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/services/autocomplete/autocomplete_cubit.dart';
import 'package:food_delivery_app/services/autocomplete/autocomplete_state.dart';
import 'package:food_delivery_app/services/places/place_cubit.dart';

import '../config/locator.dart';

class LocationSearchBox extends StatefulWidget {
  const LocationSearchBox({
    super.key,
  });

  @override
  State<LocationSearchBox> createState() => _LocationSearchBoxState();
}

class _LocationSearchBoxState extends State<LocationSearchBox> {
  final autocompleteCubit = getIt<AutocompleteCubit>();
  final placeCubit = getIt<PlaceCubit>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Enter your location',
              suffixIcon: const Icon(Icons.search),
              contentPadding: const EdgeInsets.only(
                left: 20,
                bottom: 5,
                right: 5,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white),
              ),
            ),
            onChanged: (value) {
              autocompleteCubit.getPlaces(value);
            },
          ),
        ),
        BlocBuilder<AutocompleteCubit, AutocompleteState>(
            bloc: autocompleteCubit,
            builder: (context, state) {
              if (state is Autocompleteloading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is Autocompleteloaded) {
                return Visibility(
                  visible: state.autocomplete.isNotEmpty,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    height: 300,
                    color: Colors.black.withOpacity(0.6),
                    child: ListView.builder(
                      itemCount: state.autocomplete.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            placeCubit
                                .getPlaces(state.autocomplete[index].placeid);
                          },
                          title: Text(
                            state.autocomplete[index].description,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(color: Colors.white),
                          ),
                        );
                      },
                    ),
                  ),
                );
              } else if (state is AutocompleteError) {
                return const Center(
                  child: Text('Something went wrong'),
                );
              } else {
                return const SizedBox.shrink();
              }
            })
      ],
    ));
  }
}
