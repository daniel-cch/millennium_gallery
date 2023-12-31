import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:millennium_gallery/core/app_error.dart';
import 'package:millennium_gallery/features/home/home.dart';

class ApiStarWars extends StarWarsRepository {
  final Dio dio;

  ApiStarWars({required this.dio});

  @override
  Future<Either<AppError, List<Character>>> getCharacters({
    required int page,
  }) async {
    final url = 'https://swapi.dev/api/people/?page=$page';

    try {
      final response = await dio.get(url);
      var characters = List.from(response.data['results'])
          .map((item) => CharacterModel.fromJson(item))
          .toList();

      return Right(characters);
    } catch (e) {
      return const Left(
        AppError(message: "Error Fetching Data"),
      );
    }
  }

  @override
  Future<Either<AppError, List<Film>>> getFilms() async {
    const url = 'https://swapi.dev/api/films/';

    try {
      final response = await dio.get(url);
      var films = List.from(response.data['results'])
          .map((item) => FilmModel.fromJson(item))
          .toList();

      return Right(films);
    } catch (e) {
      return const Left(
        AppError(message: "Error Fetching Data"),
      );
    }
  }
}
