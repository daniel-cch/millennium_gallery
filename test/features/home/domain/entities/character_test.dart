import 'package:flutter_test/flutter_test.dart';
import 'package:millennium_gallery/features/home/home.dart';

void main() {
  const Character character = Character(
    name: 'name',
    gender: 'gender',
    films: [1],
  );

  test('Character entity test', () {
    expect(character, isA<Character>());
    expect(character.name, 'name');
    expect(character.gender, 'gender');
    expect(character.films, isA<List<int>>());
  });
}
