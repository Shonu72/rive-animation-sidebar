import 'package:flutter/material.dart';

class FooterText extends StatelessWidget {
  final String text;
  final double fontSize;

  const FooterText({
    super.key,
    required this.text,
    this.fontSize = 13,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black.withValues(alpha: 0.7),
        fontFamily: "Inter",
        fontSize: fontSize,
      ),
    );
  }
}
