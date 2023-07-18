import 'package:flutter/material.dart';
import 'package:millennium_gallery/shared/shared.dart';

class CustomSpinner extends StatelessWidget {
  const CustomSpinner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Constants.holocronPNG,
      width: _getIconSize(context),
      height: _getIconSize(context),
    );
  }

  double _getIconSize(BuildContext context) {
    return MediaQuery.of(context).padding.top + kToolbarHeight;
  }
}
