import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:millennium_gallery/shared/constants.dart';

void main() {
  test('Constants test', () {
    expect(Constants.holocronPNG, 'assets/images/holocron.png');
    expect(Constants.rebelsPNG, 'assets/images/rebels.png');
    expect(Constants.empirePNG, 'assets/images/empire.png');
    expect(Constants.background, const Color(0xff212121));
  });
}
