import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurant_model.dart';
import 'package:food_delivery_app/widgets/restaurant_tags.dart';

class RestaurantInformation extends StatelessWidget {
  const RestaurantInformation({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            restaurant.name,
            style: textTheme.headlineMedium!
                .copyWith(color: colorScheme.secondary),
          ),
          const SizedBox(
            height: 10,
          ),
          RestaurantTags(restaurant: restaurant),
          const SizedBox(
            height: 5,
          ),
          Text(
            '${restaurant.distance.toStringAsFixed(1)} km away - \$${restaurant.deliveryFee.toStringAsFixed(2)} delivery fee',
            style: textTheme.bodySmall,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Restaurant information',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
            style: textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
