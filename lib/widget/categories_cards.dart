import 'package:flutter/material.dart';
import 'package:news_app/screen/categories_screen.dart';

class CategoriesCards extends StatelessWidget {
  const CategoriesCards({
    super.key,
    required this.image,
    required this.nameCategories,
  });
  final String image;
  final String nameCategories;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return CategoriesScreen(categories_articles: nameCategories,);
          },));
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          ),
          height: 150,
          width: 200,
          child: Text(nameCategories, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
