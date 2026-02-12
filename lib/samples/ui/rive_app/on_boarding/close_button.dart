import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CloseButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double size;

  const CloseButton({
    super.key,
    required this.onPressed,
    this.size = 36,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.circular(size / 2),
      onPressed: onPressed,
      minimumSize: Size(size, size),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(size / 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 10,
              offset: const Offset(0, 10),
            )
          ],
        ),
        child: const Icon(
          Icons.close,
          color: Colors.white,
        ),
      ),
    );
  }
}
