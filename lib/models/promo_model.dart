import 'package:faker/faker.dart';

class PromoModel {
  final int id;
  final String title;
  final String description;
  final String imageUrl;

  PromoModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageUrl});

  static List<PromoModel> promos = [
    PromoModel(
      id: 1,
      title: 'FREE Delivery on Your First 3 Orders.',
      description: 'Place an order of \$10 or more and delivery fee is on us',
      imageUrl: Faker().image.image(
        keywords: ['beer'],
        random: true,
      ),
    ),
    PromoModel(
      id: 2,
      title: '20% off on selected restaurants',
      description: 'Get a discount ar more than 200 restaurants!',
      imageUrl: Faker().image.image(
        keywords: ['wine'],
        random: true,
      ),
    )
  ];
}
