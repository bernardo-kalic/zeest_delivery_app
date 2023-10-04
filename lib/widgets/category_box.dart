import 'package:flutter/material.dart';

import '../models/category_model.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(right: 5),
      width: 80,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              height: 50,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: category.image,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                category.name,
                style: textTheme.headlineMedium!.copyWith(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
