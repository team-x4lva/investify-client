import 'dart:async';
import 'package:flutter/material.dart';

class AnimatedTypingText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final Duration letterDuration;

  const AnimatedTypingText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.letterDuration = const Duration(milliseconds: 30),
  });

  @override
  _AnimatedTypingTextState createState() => _AnimatedTypingTextState();
}

class _AnimatedTypingTextState extends State<AnimatedTypingText> {
  List<String> visibleLetters = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    Timer.periodic(widget.letterDuration, (timer) {
      if (currentIndex < widget.text.length) {
        setState(() {
          visibleLetters.add(widget.text[currentIndex]);
          currentIndex++;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      visibleLetters.join(),
      style: widget.style,
      textAlign: widget.textAlign,
    );
  }
}
