import 'package:flutter_test/flutter_test.dart';
import 'package:millennium_gallery/features/home/home.dart';

void main() {
  const Film film = Film(episodeId: 1, title: 'title');

  test('Film entity test', () {
    expect(film, isA<Film>());
    expect(film.episodeId, 1);
    expect(film.title, 'title');
  });
}
