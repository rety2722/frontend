import 'package:flutter/material.dart';

class SingInButton extends StatelessWidget {
  const SingInButton({
    super.key,
    required this.press,
  });

  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16),
      child: SizedBox(
        height: 40,
        width: 150,
        child: FloatingActionButton(
          onPressed: press,
          backgroundColor: Colors.white54,
          child: Text(
            "Sign In",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
