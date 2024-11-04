import 'dart:convert';

class Article {
  final int id;
  final String title;
  final String url;
  final String imageUrl;
  final String newsSite;
  final String summary;
  final DateTime publishedAt;
  final DateTime updatedAt;
  final bool featured;
  final List<dynamic> launches;
  final List<dynamic> events;

  Article({
    required this.id,
    required this.title,
    required this.url,
    required this.imageUrl,
    required this.newsSite,
    required this.summary,
    required this.publishedAt,
    required this.updatedAt,
    required this.featured,
    required this.launches,
    required this.events,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      imageUrl: json['image_url'],
      newsSite: json['news_site'],
      summary: json['summary'],
      publishedAt: DateTime.parse(json['published_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      featured: json['featured'],
      launches: json['launches'],
      events: json['events'],
    );
  }
}

class ArticleApiResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<Article> results;

  ArticleApiResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory ArticleApiResponse.fromJson(Map<String, dynamic> json) {
    return ArticleApiResponse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: List<Article>.from(json['results'].map((x) => Article.fromJson(x))),
    );
  }
}