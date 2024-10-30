import 'package:flutter/material.dart';
import 'package:webapp_frontend/widgets/article.dart';
import 'package:webapp_frontend/widgets/game_snippet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Welcome to flutter workshop",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...gameSnippets.map((gameSnippet) => Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: gameSnippet,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Articles",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                ),
              ),
              ...articles.map(
                      (article) => Padding(
                        padding: const EdgeInsets.all(10),
                        child: article,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

List<GameSnippet> gameSnippets = [
  const GameSnippet(),
  const GameSnippet(),
  const GameSnippet(),
];

List<Article> articles = [
  const Article(),
  const Article(),
  const Article(),
];