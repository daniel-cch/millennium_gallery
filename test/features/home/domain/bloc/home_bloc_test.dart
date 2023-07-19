import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:millennium_gallery/core/core.dart';
import 'package:millennium_gallery/features/home/home.dart';
import 'package:mocktail/mocktail.dart';

class MockStarWars extends Mock implements StarWarsRepository {}

void main() {
  final MockStarWars starWarsRepo = MockStarWars();
  const String errorMessage = 'Error Fetching Data';
  const List<Film> films = [
    Film(
      episodeId: 1,
      title: 'title',
    ),
  ];
  const List<Character> characters = [
    Character(
      name: 'name',
      gender: 'gender',
      films: [
        1,
      ],
    ),
  ];
  const CharacterFilters filter = CharacterFilters.male;

  group('Home Bloc Tests', () {
    blocTest<HomeBloc, HomeState>(
      'emits [HomeLoadingState, HomeLoadedState] when FetchDataEvent is added',
      build: () {
        return HomeBloc(
          starWarsRepository: starWarsRepo,
        );
      },
      act: (bloc) => bloc.add(
        const FetchDataEvent(
          page: 1,
        ),
      ),
      setUp: () {
        when(() => starWarsRepo.getCharacters(page: 1)).thenAnswer(
          (_) async => const Right(characters),
        );

        when(() => starWarsRepo.getFilms()).thenAnswer(
          (_) async => const Right(films),
        );
      },
      expect: () => [
        const HomeLoadingState(
          page: 1,
          filter: null,
          characters: [],
          films: [],
        ),
        const HomeLoadedState(
          page: 1,
          filter: null,
          characters: characters,
          films: films,
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits [HomeLoadingState, HomeErrorState] when FetchDataEvent is added',
      build: () {
        return HomeBloc(
          starWarsRepository: starWarsRepo,
        );
      },
      act: (bloc) => bloc.add(
        const FetchDataEvent(
          page: 1,
        ),
      ),
      setUp: () {
        when(() => starWarsRepo.getCharacters(page: 1)).thenAnswer(
          (_) async => const Left(AppError(message: errorMessage)),
        );

        when(() => starWarsRepo.getFilms()).thenAnswer(
          (_) async => const Right(films),
        );
      },
      expect: () => [
        const HomeLoadingState(
          page: 1,
          filter: null,
          characters: [],
          films: [],
        ),
        const HomeErrorState(
          page: 1,
          filter: null,
          characters: [],
          films: [],
          message: errorMessage,
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits [HomeLoadingState, HomeErrorState] when FetchDataEvent is added',
      build: () {
        return HomeBloc(
          starWarsRepository: starWarsRepo,
        );
      },
      act: (bloc) => bloc.add(
        const FetchDataEvent(
          page: 1,
        ),
      ),
      setUp: () {
        when(() => starWarsRepo.getCharacters(page: 1)).thenAnswer(
          (_) async => const Right(characters),
        );

        when(() => starWarsRepo.getFilms()).thenAnswer(
          (_) async => const Left(AppError(message: errorMessage)),
        );
      },
      expect: () => [
        const HomeLoadingState(
          page: 1,
          filter: null,
          characters: [],
          films: [],
        ),
        const HomeErrorState(
          page: 1,
          filter: null,
          characters: [],
          films: [],
          message: errorMessage,
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits [FilterChangedState] when ChangeFilterEvent is added',
      build: () {
        return HomeBloc(
          starWarsRepository: starWarsRepo,
        );
      },
      act: (bloc) {
        bloc.add(
          const ChangeFilterEvent(
            filter: filter,
          ),
        );

        bloc.add(
          const ChangeFilterEvent(
            filter: filter,
          ),
        );
      },
      expect: () => [
        const FilterChangedState(
          page: 1,
          filter: filter,
          characters: [],
          films: [],
        ),
        const FilterChangedState(
          page: 1,
          filter: null,
          characters: [],
          films: [],
        ),
      ],
    );
  });
}
