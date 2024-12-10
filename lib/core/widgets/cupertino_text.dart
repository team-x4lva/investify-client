import 'package:flutter/material.dart';

class CupertinoText extends StatelessWidget {
  const CupertinoText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: '.SF Pro Display',
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
