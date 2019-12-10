class News {
  String auther;
  String title;
  String description;
  String url;
  String urlImage;
  String publishedAt;
  String content;

  News(
      {this.auther = "",
      this.title,
      this.description,
      this.url,
      this.urlImage,
      this.publishedAt,
      this.content});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      auther: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      urlImage: json['urlToImage'] as String,
      publishedAt: json['publishedAt'] as String,
      content: json['content'] as String,
    );
  }
}
