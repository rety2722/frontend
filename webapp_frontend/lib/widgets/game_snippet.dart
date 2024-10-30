import 'package:flutter/material.dart';

class GameSnippet extends StatelessWidget {
  const GameSnippet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: 260,
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          const Text("Game snippet"),
        ],
      ),
    );
  }
}