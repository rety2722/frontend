import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.name, 
    required this.message
  });

  final String name, message;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white54,
        child: Icon(CupertinoIcons.person_alt, color: Colors.white),
      ),
      title: Text(
        name,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        message,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}