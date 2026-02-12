import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/ui/rive_app/assets.dart' as app_assets;
import 'package:rive/rive.dart';

class AnimatedRiveButton extends StatelessWidget {
  final RiveAnimationController controller;
  final VoidCallback onTap;
  final String text;
  final IconData icon;
  final double width;
  final double height;

  const AnimatedRiveButton({
    super.key,
    required this.controller,
    required this.onTap,
    this.text = "Start the course",
    this.icon = Icons.arrow_forward_rounded,
    this.width = 236,
    this.height = 64,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 10,
                offset: const Offset(0, 10),
              )
            ],
          ),
          child: Stack(
            children: [
              RiveAnimation.asset(
                app_assets.buttonRiv,
                fit: BoxFit.cover,
                controllers: [controller],
              ),
              Center(
                child: Transform.translate(
                  offset: const Offset(4, 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(icon),
                      const SizedBox(width: 4),
                      Text(
                        text,
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
