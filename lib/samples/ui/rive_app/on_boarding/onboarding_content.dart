import 'package:flutter/material.dart';

class OnBoardingContent extends StatelessWidget {
  final String title;
  final String description;

  const OnBoardingContent({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 260,
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 60,
              ),
            ),
          ),
          Text(
            description,
            style: TextStyle(
              color: Colors.black.withValues(alpha: 0.7),
              fontFamily: "Inter",
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
