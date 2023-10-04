import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/restaurant_tags.dart';

import '../models/restaurant_model.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/restaurant-details',
          arguments: restaurant,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: NetworkImage(
                          restaurant.imageUrl,
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    height: 30,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '${restaurant.deliveryTime} min',
                        style: textTheme.bodySmall,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.name,
                  style: textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 5,
                ),
                // Text('${restaurant.tags}'),
                RestaurantTags(restaurant: restaurant),
                const SizedBox(
                  height: 5,
                ),
                Text(
                    '${restaurant.distance.toStringAsFixed(1)}km - \$${restaurant.deliveryFee.toStringAsFixed(2)} delivery fee',
                    style: textTheme.bodyLarge)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
