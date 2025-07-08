
import 'package:flutter/material.dart';
import 'package:news_app/models/categories_models.dart';
import 'package:news_app/widget/categories_cards.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
    required this.categories,
  });

  final List<CategoriesModels> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoriesCards(
            image: categories[index].imageCategories,
            nameCategories: categories[index].nameCategories,
          );
        },
      ),
    );
  }
}
