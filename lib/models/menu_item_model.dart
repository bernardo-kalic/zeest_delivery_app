import 'dart:core';

class MenuItem {
  final int id;
  final int restaurantId;
  final String name;
  final String category;
  final String description;
  final double price;

  MenuItem({
    required this.id,
    required this.restaurantId,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
  });

  static List<MenuItem> menuItems = [
    MenuItem(
      id: 1,
      restaurantId: 1,
      name: 'Pepperoni Pizza',
      category: 'Pizza',
      description: 'Pizza with Tomatoes',
      price: 5.99,
    ),
    MenuItem(
      id: 5,
      restaurantId: 1,
      name: 'Guarana',
      category: 'Drinks',
      description: 'Cold Guarana',
      price: 5.99,
    ),
    MenuItem(
      id: 2,
      restaurantId: 1,
      name: '4 Fromaggi',
      category: 'Pizza',
      description: 'Pizza with lots of cheese!',
      price: 5.99,
    ),
    MenuItem(
      id: 3,
      restaurantId: 1,
      name: 'Mushroom Pizza',
      category: 'Pizza',
      description: 'Pizza with Mushrooms',
      price: 5.99,
    ),
    MenuItem(
      id: 4,
      restaurantId: 1,
      name: 'Coca-Cola',
      category: 'Drinks',
      description: 'A cold beverage',
      price: 1.99,
    )
  ];
}
