class ArticleModels {
  final String? urlToImage;
  final String? title;
  final String? description;

  ArticleModels({this.urlToImage, this.title, this.description});

  factory ArticleModels.fromJson(Map<String, dynamic> json) {
    return ArticleModels(
      urlToImage: json['urlToImage'],
      title: json['title'],
      description: json['description'],
    );
  }
}
