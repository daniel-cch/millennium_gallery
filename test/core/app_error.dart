import 'package:flutter_test/flutter_test.dart';
import 'package:millennium_gallery/core/app_error.dart';

void main() {
  const AppError appError = AppError(message: 'error');

  test('CharacterFilters test', () {
    expect(appError, isA<AppError>());
    expect(appError.message, 'error');
  });
}
