class ModelViewArticle {
  final String title;
  final String publishAt;
  final String description;
  final String url;
  final String urlToImage;

  ModelViewArticle({
    required this.title,
    required this.description,
    required this.publishAt,
    required this.url,
    required this.urlToImage,
  });

  factory ModelViewArticle.fromJson(Map<String, dynamic> json) {
    return ModelViewArticle(
      title: json["title"],
      description: json["description"],
      urlToImage: json["urlToImage"],
      url: json["url"],
      publishAt: json["publishAt"],
    );
  }
}
