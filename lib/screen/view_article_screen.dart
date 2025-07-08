import 'package:flutter/material.dart';
import 'package:news_app/models/article_models.dart';

class ViewArticleScreen extends StatefulWidget {
  const ViewArticleScreen({super.key, required this.article});
  final ArticleModels article;
  @override
  State<ViewArticleScreen> createState() => _ViewArticleScreenState();
}

class _ViewArticleScreenState extends State<ViewArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.network(widget.article.urlToImage.toString()),
            SizedBox(height: 10,),
            Text(widget.article.title.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text(widget.article.description.toString()),
          ],
        ),
      ),
    );
  }
}
