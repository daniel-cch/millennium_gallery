import 'package:dartz/dartz.dart';
import 'package:millennium_gallery/core/core.dart';
import 'package:millennium_gallery/features/home/domain/domain.dart';

abstract class StarWarsRepository {
  Future<Either<AppError, List<Character>>> getCharacters({
    required int page,
  });
  Future<Either<AppError, List<Film>>> getFilms();
}
