import 'package:flutter/material.dart';
import 'package:kueski_challenge/theme/colors.dart';
import 'package:kueski_challenge/theme/decorations.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    required this.animatedOpacity,
    super.key,
    this.backgroundImage,
    this.color = Colors.black,
    this.opacity = 1,
  });

  final String? backgroundImage;
  final Color color;
  final double opacity;
  final double animatedOpacity;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        if (backgroundImage == null) Container() else _buildAnimatedOpacity(),
        _buildCoverColor(color, opacity),
        _buildGradientRect(size),
        _buildBottomGradientRect(size),
      ],
    );
  }

  Widget _buildAnimatedOpacity() {
    return AnimatedOpacity(
      opacity: animatedOpacity,
      duration: Duration(milliseconds: animatedOpacity == 0.0 ? 750 : 500),
      curve: animatedOpacity == 0.0 ? Curves.easeOut : Curves.easeIn,
      child: SizedBox(
        height: double.infinity,
        child: Image(
          image: NetworkImage(backgroundImage!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Positioned _buildBottomGradientRect(Size size) {
    return Positioned(
      width: size.width,
      height: size.height * 0.15,
      bottom: 0,
      child: Container(
        decoration: gradientRect(
          first: Colors.transparent,
          second: gradientBlue,
        ),
      ),
    );
  }

  Container _buildCoverColor(Color color, double opacity) {
    return Container(
      decoration: BoxDecoration(
        color: color.withValues(alpha: opacity),
      ),
    );
  }

  Container _buildGradientRect(Size size) {
    return Container(
      decoration: gradientRect(
        first: gradientBlue,
        second: Colors.transparent,
      ),
      height: size.height * 0.15,
    );
  }
}
