import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:millennium_gallery/core/core.dart';
import 'package:millennium_gallery/features/home/home.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  MockDio dio = MockDio();
  ApiStarWars api = ApiStarWars(dio: dio);

  group('getCharacters', () {
    test('getCharacters returns characters', () async {
      const url = 'https://swapi.dev/api/people/?page=1';
      final data = {
        "results": [
          {
            "name": "Luke",
            "gender": "male",
            "films": [
              "https://swapi.dev/api/films/1/",
            ],
          },
        ]
      };

      final dioResponse = Response(
        requestOptions: RequestOptions(),
        data: data,
      );

      when(() => dio.get(url)).thenAnswer((_) async => dioResponse);

      final response = await api.getCharacters(page: 1);
      final responseFold = response.fold((l) => l, (r) => r);
      final characters = <Character>[
        const CharacterModel(
          name: 'Luke',
          gender: 'male',
          films: [1],
        ),
      ];

      expect(response, isA<Either<AppError, List<Character>>>());
      expect(responseFold, isA<List<Character>>());
      expect(responseFold as List<Character>, characters);
    });

    test('getCharacters returns AppError', () async {
      const url = 'https://swapi.dev/api/people/?page=1';
      final data = {};

      final dioResponse = Response(
        requestOptions: RequestOptions(),
        data: data,
      );

      when(() => dio.get(url)).thenAnswer((_) async => dioResponse);

      final response = await api.getCharacters(page: 1);
      final responseFold = response.fold((l) => l, (r) => r);
      const appError = AppError(message: "Error Fetching Data");

      expect(response, isA<Either<AppError, List<Character>>>());
      expect(responseFold, isA<AppError>());
      expect(responseFold as AppError, appError);
    });
  });

  group('getFilms', () {
    test('getFilms returns films', () async {
      const url = 'https://swapi.dev/api/films/';
      final data = {
        "results": [
          {
            "title": "A New Hope",
            "episode_id": 4,
          },
        ]
      };

      final dioResponse = Response(
        requestOptions: RequestOptions(),
        data: data,
      );

      when(() => dio.get(url)).thenAnswer((_) async => dioResponse);

      final response = await api.getFilms();
      final responseFold = response.fold((l) => l, (r) => r);
      final films = <Film>[
        const FilmModel(
          episodeId: 4,
          title: 'A New Hope',
        ),
      ];

      expect(response, isA<Either<AppError, List<Film>>>());
      expect(responseFold, isA<List<Film>>());
      expect(responseFold as List<Film>, films);
    });

    test('getCharacters returns AppError', () async {
      const url = 'https://swapi.dev/api/films/';
      final data = {};

      final dioResponse = Response(
        requestOptions: RequestOptions(),
        data: data,
      );

      when(() => dio.get(url)).thenAnswer((_) async => dioResponse);

      final response = await api.getFilms();
      final responseFold = response.fold((l) => l, (r) => r);
      const appError = AppError(message: "Error Fetching Data");

      expect(response, isA<Either<AppError, List<Film>>>());
      expect(responseFold, isA<AppError>());
      expect(responseFold as AppError, appError);
    });
  });
}
