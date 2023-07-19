import 'package:flutter_test/flutter_test.dart';
import 'package:millennium_gallery/features/home/home.dart';

void main() {
  const CharacterFilters male = CharacterFilters.male;
  const CharacterFilters female = CharacterFilters.female;

  test('CharacterFilters test', () {
    expect(male, isA<CharacterFilters>());
    expect(male, CharacterFilters.male);
    expect(female, CharacterFilters.female);
  });
}
