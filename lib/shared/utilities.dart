import 'package:millennium_gallery/features/home/home.dart';

class Utilities {
  static int getIdFromFilm(String url) {
    const start = 'https://swapi.dev/api/films/';
    const end = '/';

    final startIndex = url.indexOf(start);
    final endIndex = url.indexOf(end, startIndex + start.length);
    final substring = url.substring(startIndex + start.length, endIndex);

    return int.parse(substring);
  }

  static String getGender(CharacterFilters filters) {
    if (filters == CharacterFilters.male) {
      return 'male';
    }

    if (filters == CharacterFilters.female) {
      return 'female';
    }

    return '';
  }

  static List<Character> filterList(
    CharacterFilters? filter,
    List<Character> characters,
  ) {
    if (filter == null) {
      return characters;
    }

    return characters
        .where((element) => element.gender == Utilities.getGender(filter))
        .toList();
  }
}
