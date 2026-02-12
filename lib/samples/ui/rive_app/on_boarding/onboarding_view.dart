import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_samples/samples/ui/rive_app/on_boarding/blurred_bg.dart';
import 'package:flutter_samples/samples/ui/rive_app/on_boarding/close_button.dart'
    as custom;
import 'package:flutter_samples/samples/ui/rive_app/on_boarding/footer.dart';
import 'package:flutter_samples/samples/ui/rive_app/on_boarding/overlay_back.dart';
import 'package:flutter_samples/samples/ui/rive_app/on_boarding/signin_view.dart';
import 'package:rive/rive.dart';

import 'animated_rive_button.dart';
import 'onboarding_content.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key, this.closeModal});

  // Close modal callback for any screen that uses this as a modal
  final Function? closeModal;

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView>
    with TickerProviderStateMixin {
  // Animation controller that shows the sign up modal as well as translateY boarding content together
  AnimationController? _signInAnimController;

  // Control touch effect animation for the "Start the Course" button
  late RiveAnimationController _btnController;

  @override
  void initState() {
    super.initState();
    _signInAnimController = AnimationController(
      duration: const Duration(milliseconds: 350),
      upperBound: 1,
      vsync: this,
    );

    _btnController = OneShotAnimation("active", autoplay: false);

    const springDesc = SpringDescription(
      mass: 0.1,
      stiffness: 40,
      damping: 5,
    );

    _btnController.isActiveChanged.addListener(() {
      if (!_btnController.isActive) {
        final springAnim = SpringSimulation(springDesc, 0, 1, 0);
        _signInAnimController?.animateWith(springAnim);
      }
    });
  }

  @override
  void dispose() {
    _signInAnimController?.dispose();
    _btnController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Background with blur effects
          const BlurredBackground(),

          // Main onboarding content
          _buildAnimatedContent(),

          // Sign-in modal overlay
          _buildSignInOverlay(),
        ],
      ),
    );
  }

  Widget _buildAnimatedContent() {
    return AnimatedBuilder(
      animation: _signInAnimController!,
      builder: (context, child) {
        return Transform(
          transform: Matrix4.translationValues(
            0,
            -50 * _signInAnimController!.value,
            0,
          ),
          child: child,
        );
      },
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 80, 40, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title and description
              const Expanded(
                child: OnBoardingContent(
                  title: "Learn design & code",
                  description:
                      "Don't skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools.",
                ),
              ),
              const SizedBox(height: 16),

              // Animated button
              AnimatedRiveButton(
                controller: _btnController,
                onTap: () {
                  _btnController.isActive = true;
                },
              ),
              const SizedBox(height: 16),

              // Footer text
              const FooterText(
                text:
                    "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates.",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignInOverlay() {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _signInAnimController!,
        builder: (context, child) {
          return Stack(
            children: [
              // Close button
              Positioned(
                top: 100 - (_signInAnimController!.value * 200),
                right: 20,
                child: SafeArea(
                  child: custom.CloseButton(
                    onPressed: () {
                      widget.closeModal!();
                    },
                  ),
                ),
              ),

              // Backdrop overlay
              OverlayBackdrop(
                opacity: 0.4 * _signInAnimController!.value,
              ),

              // Sign-in view
              Transform.translate(
                offset: Offset(
                  0,
                  -MediaQuery.of(context).size.height *
                      (1 - _signInAnimController!.value),
                ),
                child: child,
              ),
            ],
          );
        },
        child: SignInView(
          closeModal: () {
            _signInAnimController?.reverse();
          },
        ),
      ),
    );
  }
}
