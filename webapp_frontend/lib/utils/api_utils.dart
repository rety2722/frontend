import '../api_entities/article.dart';

/// This is the class that contains all the API calls that are made to the server.
///
/// If you wish to run on android, you should add this to the AndroidManifest.xml:
/// <uses-permission android:name="android.permission.INTERNET" />

import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiUtils {

  static final ApiUtils _instance = ApiUtils._internal();
  factory ApiUtils() => _instance;

  ApiUtils._internal();

  static const String baseUrl = 'https://api.spaceflightnewsapi.net/v4/articles/';

  static Future<ArticleApiResponse> fetchArticles({int limit = 10, int offset = 0}) async {
    final response = await http.get(Uri.parse('$baseUrl?limit=$limit&offset=$offset'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return ArticleApiResponse.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load articles');
    }
  }

}