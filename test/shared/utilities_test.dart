import 'package:flutter_test/flutter_test.dart';
import 'package:millennium_gallery/features/home/domain/domain.dart';
import 'package:millennium_gallery/shared/shared.dart';

void main() {
  group('getIdFromFilm tests', () {
    test('Utilities.getIdFromFilm test', () {
      const url = 'https://swapi.dev/api/films/1/';

      expect(Utilities.getIdFromFilm(url), 1);
    });

    test('Utilities.getIdFromFilm test', () {
      const url = 'https://swapi.dev/api/films/5/';

      expect(Utilities.getIdFromFilm(url), 5);
    });
  });

  group('getGender tests', () {
    test('getGender test', () {
      const filterMale = CharacterFilters.male;
      const filterFemale = CharacterFilters.female;

      expect(Utilities.getGender(filterMale), 'male');
      expect(Utilities.getGender(filterFemale), 'female');
    });
  });

  group('filterList tests', () {
    test('filterList test', () {
      const filterNull = null;
      const filterMale = CharacterFilters.male;
      const filterFemale = CharacterFilters.female;

      const allCharacters = <Character>[
        Character(
          name: 'Luke',
          gender: 'male',
          films: [1],
        ),
        Character(
          name: 'Leia',
          gender: 'female',
          films: [1],
        ),
      ];
      const maleCharacters = <Character>[
        Character(
          name: 'Luke',
          gender: 'male',
          films: [1],
        ),
      ];
      const femaleCharacters = <Character>[
        Character(
          name: 'Leia',
          gender: 'female',
          films: [1],
        ),
      ];

      expect(Utilities.filterList(filterNull, allCharacters), allCharacters);
      expect(Utilities.filterList(filterMale, allCharacters), maleCharacters);
      expect(
        Utilities.filterList(filterFemale, allCharacters),
        femaleCharacters,
      );
    });
  });
}
