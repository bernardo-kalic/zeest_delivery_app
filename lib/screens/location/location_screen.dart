import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/config/locator.dart';
import 'package:food_delivery_app/screens/location/bloc/location_cubit.dart';
import 'package:food_delivery_app/screens/location/bloc/location_state.dart';
import 'package:food_delivery_app/services/places/place_cubit.dart';
import 'package:food_delivery_app/services/places/place_state.dart';

import '../../widgets/widgets.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  static const String routeName = '/location';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const LocationScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final geolocationCubit = getIt<GeolocationCubit>();
  final placeCubit = getIt<PlaceCubit>();

  @override
  void initState() {
    super.initState();
    geolocationCubit.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PlaceCubit, PlaceState>(
          bloc: placeCubit,
          builder: (context, state) {
            if (state is InitialPlace) {
              return Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: BlocBuilder<GeolocationCubit, GeolocationState>(
                        bloc: geolocationCubit,
                        builder: (context, state) {
                          if (state is GeolocationLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is GeolocationLoaded) {
                            return Gmap(
                              lat: state.position.latitude,
                              lng: state.position.longitude,
                            );
                          } else {
                            return const Center(
                              child: Text('Something went wrong'),
                            );
                          }
                        }),
                  ),
                  const Location(),
                  const SaveButton()
                ],
              );
            } else if (state is Placeloading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is Placeloaded) {
              return Stack(
                children: [
                  Gmap(
                    lat: state.place.lat,
                    lng: state.place.lng,
                  ),
                  const Location(),
                  const SaveButton()
                ],
              );
            } else {
              return const Text('Something went wrong');
            }
          }),
    );
  }
}

class Location extends StatelessWidget {
  const Location({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 20,
      right: 20,
      child: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/logo.svg',
              height: 50,
            ),
            const SizedBox(
              width: 10,
            ),
            const LocationSearchBox()
          ],
        ),
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      left: 20,
      right: 20,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70),
        child: ElevatedButton(onPressed: () {}, child: const Text('Save')),
      ),
    );
  }
}
