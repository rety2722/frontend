import 'package:flutter/material.dart';

import '../api_entities/article.dart';

class ArticleWidget extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String summary;
  final String newsSite;
  final String url;

  const ArticleWidget({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.summary,
    required this.newsSite,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              summary,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Source: $newsSite',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
          ButtonBar(
            children: [
              TextButton(
                child: Text('Read More'),
                onPressed: () {
                  _launchURL(context, url);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _launchURL(BuildContext context, String url) {
    // Implement URL launch functionality here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Opening: $url')),
    );
  }
}

ArticleWidget articleToWidget(Article article) {
  return ArticleWidget(
    title: article.title,
    imageUrl: article.imageUrl,
    summary: article.summary,
    newsSite: article.newsSite,
    url: article.url,
  );
}