import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/ui/rive_app/theme.dart';

class OverlayBackdrop extends StatelessWidget {
  final double opacity;

  const OverlayBackdrop({
    super.key,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: IgnorePointer(
        ignoring: true,
        child: Opacity(
          opacity: opacity,
          child: Container(color: RiveAppTheme.shadow),
        ),
      ),
    );
  }
}
