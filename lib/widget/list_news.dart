import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screen/view_article_screen.dart';

import 'package:news_app/services/news_services.dart';

class ListNews extends StatefulWidget {
  const ListNews({super.key});

  @override
  State<ListNews> createState() => _ListNewsState();
}

class _ListNewsState extends State<ListNews> {
  NewsServices news = NewsServices(Dio());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: news.getNews(category: 'general'),
      builder: (context, snapshot) {
        // print("snapshot :${snapshot}");
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            print("snapshot: ${snapshot.data!.length}");
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ViewArticleScreen(article: snapshot.data![index]);
                    },
                  ),
                );
              },
              child: Container(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        snapshot.data?[index].urlToImage ??
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png",
                      ),
                    ),
                    Text(
                      snapshot.data?[index].title ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      snapshot.data?[index].description ?? "",
                      style: TextStyle(color: Colors.grey),
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
