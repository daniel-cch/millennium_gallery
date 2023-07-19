import 'package:flutter_test/flutter_test.dart';
import 'package:millennium_gallery/shared/shared.dart';

void main() {
  test('Utilities.getIdFromFilm test', () {
    const url = 'https://swapi.dev/api/films/1/';

    expect(Utilities.getIdFromFilm(url), 1);
  });

  test('Utilities.getIdFromFilm test', () {
    const url = 'https://swapi.dev/api/films/5/';

    expect(Utilities.getIdFromFilm(url), 5);
  });
}
