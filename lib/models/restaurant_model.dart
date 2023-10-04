import 'dart:math';

import 'package:faker/faker.dart';
import 'package:food_delivery_app/models/menu_item_model.dart';

var faker = Faker();

class Restaurant {
  final int id;
  final String imageUrl;
  final String name;
  final List<String> tags;
  final List<MenuItem> menuItems;
  final int deliveryTime;
  final double deliveryFee;
  final double distance;

  Restaurant({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.tags,
    this.menuItems = const [],
    required this.deliveryTime,
    required this.deliveryFee,
    required this.distance,
  });

  static List<Restaurant> restaurants = [
    Restaurant(
      id: 1,
      imageUrl: faker.image.image(
          width: 1080, height: 720, random: true, keywords: ['restaurant']),
      name: faker.company.name(),
      tags: MenuItem.menuItems
          .where((menuIt) => menuIt.restaurantId == 1)
          .map((menuItem) => menuItem.category)
          .toSet()
          .toList(),
      deliveryTime: faker.randomGenerator.integer(10),
      deliveryFee: Random().nextDouble() * 150,
      distance: Random().nextDouble() * 300,
      menuItems: MenuItem.menuItems
          .where((menuIt) => menuIt.restaurantId == 1)
          .toList(),
    ),
    Restaurant(
      id: 2,
      imageUrl: faker.image.image(
          width: 1080, height: 720, random: true, keywords: ['restaurant']),
      name: faker.company.name(),
      tags: MenuItem.menuItems
          .where((menuIt) => menuIt.restaurantId == 2)
          .map((menuItem) => menuItem.category)
          .toSet()
          .toList(),
      deliveryTime: faker.randomGenerator.integer(10),
      deliveryFee: Random().nextDouble() * 150,
      distance: Random().nextDouble() * 300,
      menuItems: MenuItem.menuItems
          .where((menuIt) => menuIt.restaurantId == 2)
          .toList(),
    ),
    Restaurant(
      id: 3,
      imageUrl: faker.image.image(
          width: 1080, height: 720, random: true, keywords: ['restaurant']),
      name: faker.company.name(),
      tags: MenuItem.menuItems
          .where((menuIt) => menuIt.restaurantId == 3)
          .map((menuItem) => menuItem.category)
          .toSet()
          .toList(),
      deliveryTime: faker.randomGenerator.integer(10),
      deliveryFee: Random().nextDouble() * 150,
      distance: Random().nextDouble() * 300,
      menuItems: MenuItem.menuItems
          .where((menuIt) => menuIt.restaurantId == 3)
          .toList(),
    ),
    Restaurant(
      id: 4,
      imageUrl: faker.image.image(
          width: 1080, height: 720, random: true, keywords: ['restaurant']),
      name: faker.company.name(),
      tags: MenuItem.menuItems
          .where((menuIt) => menuIt.restaurantId == 4)
          .map((menuItem) => menuItem.category)
          .toSet()
          .toList(),
      deliveryTime: faker.randomGenerator.integer(10),
      deliveryFee: Random().nextDouble() * 150,
      distance: Random().nextDouble() * 300,
      menuItems: MenuItem.menuItems
          .where((menuIt) => menuIt.restaurantId == 4)
          .toList(),
    )
  ];
}
