import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurant_model.dart';
import 'package:food_delivery_app/widgets/restaurant_information.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  const RestaurantDetailsScreen({super.key, required this.restaurant});

  final Restaurant restaurant;

  static const String routeName = '/restaurant-details';

  static Route route({required Restaurant restaurant}) {
    return MaterialPageRoute(
      builder: (_) => RestaurantDetailsScreen(restaurant: restaurant),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: const RoundedRectangleBorder()),
                    child: const Text('Basket'),
                  ),
                )
              ],
            ),
          ),
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 50)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      restaurant.imageUrl,
                    ),
                  ),
                ),
              ),
              RestaurantInformation(restaurant: restaurant),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: restaurant.tags.length,
                  itemBuilder: (context, index) =>
                      _buildMenuItems(restaurant, context, index))
            ],
          ),
        ));
  }
}

Widget _buildMenuItems(Restaurant restaurant, BuildContext context, int index) {
  var textTheme = Theme.of(context).textTheme;
  var colorScheme = Theme.of(context).colorScheme;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          restaurant.tags[index],
          style:
              textTheme.headlineMedium!.copyWith(color: colorScheme.secondary),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: restaurant.menuItems
            .where((item) => item.category == restaurant.tags[index])
            .map((item) => Column(
                  children: [
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          item.name,
                          style: textTheme.headlineSmall,
                        ),
                        subtitle: Text(
                          item.description,
                          style: textTheme.bodySmall,
                        ),
                        trailing: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '\$${item.price}',
                              style: textTheme.bodySmall,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add_circle,
                                color: colorScheme.secondary,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      height: 2,
                    )
                  ],
                ))
            .toList(),
      )
    ],
  );
}
