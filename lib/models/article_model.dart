class ArticleModel {
  final String? image;
  final String title;
  final String? subtitle;
  final Source source;
  final String url;

  ArticleModel({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.source,
    required this.url,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      image: json['urlToImage'],
      title: json['title'] ?? '',
      subtitle: json['description'],
      source: Source.fromJson(json['source']),
      url: json['url'] ?? '',
    );
  }
}

class Source {
  final String? id;
  final String? name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }
}
