import 'package:flutter/material.dart';
import 'package:galactic_compass/galactic_compass.dart';
import 'package:millennium_gallery/shared/shared.dart';

class CustomSpinner extends StatefulWidget {
  const CustomSpinner({Key? key}) : super(key: key);

  @override
  State<CustomSpinner> createState() => _CustomSpinnerState();
}

class _CustomSpinnerState extends State<CustomSpinner>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 0),
      vsync: this,
      lowerBound: 0.0,
      upperBound: 360.0,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GalacticCompassData>(
      stream: GalacticCompass.getOrientation(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final angle = snapshot.data?.toRadians().angle ?? 0.0;

          if (!_controller.isAnimating && angle != _controller.value) {
            _controller.animateTo(angle);
          }

          return AnimatedBuilder(
            animation: _controller,
            child: Image.asset(
              Constants.holocronPNG,
              width: _getIconSize(context),
              height: _getIconSize(context),
            ),
            builder: (context, child) {
              return Transform.rotate(
                angle: _controller.value,
                child: child,
              );
            },
          );
        }

        return Image.asset(
          Constants.holocronPNG,
          width: _getIconSize(context),
          height: _getIconSize(context),
        );
      },
    );
  }

  double _getIconSize(BuildContext context) {
    return MediaQuery.of(context).padding.top + kToolbarHeight;
  }
}
