import 'package:flutter_test/flutter_test.dart';
import 'package:millennium_gallery/features/home/home.dart';

void main() {
  const CharacterModel characterModel = CharacterModel(
    name: 'name',
    gender: 'gender',
    films: [1],
  );
  const Map<String, dynamic> json = {
    'name': 'Luke',
    'gender': 'male',
    'films': <String>['https://swapi.dev/api/films/1/'],
  };
  final CharacterModel characterModelFromJson = CharacterModel.fromJson(json);

  test('Character entity test', () {
    expect(characterModel, isA<CharacterModel>());
    expect(characterModel.name, 'name');
    expect(characterModel.gender, 'gender');
    expect(characterModel.films, isA<List<int>>());

    expect(characterModelFromJson, isA<CharacterModel>());
    expect(characterModelFromJson.name, 'Luke');
    expect(characterModelFromJson.gender, 'male');
    expect(characterModelFromJson.films, isA<List<int>>());
  });
}
