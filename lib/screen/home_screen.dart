import 'package:flutter/material.dart';
import 'package:news_app/models/categories_models.dart';
import 'package:news_app/widget/categories.dart';
import 'package:news_app/widget/list_news.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoriesModels> categories = [
      CategoriesModels(
        imageCategories: 'assets/business.avif',
        nameCategories: 'business',
      ),
      CategoriesModels(
        imageCategories: 'assets/entertaiment.avif',
        nameCategories: 'entertaiment',
      ),
      CategoriesModels(
        imageCategories: 'assets/general.avif',
        nameCategories: 'general',
      ),
      CategoriesModels(
        imageCategories: 'assets/health.avif',
        nameCategories: 'health',
      ),
      CategoriesModels(
        imageCategories: 'assets/science.avif',
        nameCategories: 'science',
      ),
      CategoriesModels(
        imageCategories: 'assets/sports.avif',
        nameCategories: 'sports',
      ),
      CategoriesModels(
        imageCategories: 'assets/technology.jpeg',
        nameCategories: 'technology',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("News"),
            Text(
              "Cloud",
              style: TextStyle(color: Color.fromRGBO(245, 200, 140, 4)),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: Categories(categories: categories)),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(child: ListNews()),
          ],
        ),
      ),
    );
  }
}
