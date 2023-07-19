import 'package:flutter_test/flutter_test.dart';
import 'package:millennium_gallery/features/home/home.dart';

void main() {
  const FilmModel filmModel = FilmModel(
    episodeId: 1,
    title: 'title',
  );
  const Map<String, dynamic> json = {
    'episode_id': 1,
    'title': 'A new hope',
  };
  final FilmModel filmModelFromJson = FilmModel.fromJson(json);

  test('Character entity test', () {
    expect(filmModel, isA<FilmModel>());
    expect(filmModel.episodeId, 1);
    expect(filmModel.title, 'title');

    expect(filmModelFromJson, isA<FilmModel>());
    expect(filmModelFromJson.episodeId, 1);
    expect(filmModelFromJson.title, 'A new hope');
  });
}
