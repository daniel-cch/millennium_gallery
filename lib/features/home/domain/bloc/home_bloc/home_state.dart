part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState({
    required this.page,
    required this.filter,
    required this.characters,
    required this.films,
  });

  final int page;
  final CharacterFilters? filter;
  final List<Character> characters;
  final List<Film> films;

  @override
  List<Object?> get props => [
        page,
        filter,
        characters,
        films,
      ];
}

class HomeInitialState extends HomeState {
  const HomeInitialState({
    required int page,
    required CharacterFilters? filter,
    required List<Character> characters,
    required List<Film> films,
  }) : super(
          page: page,
          filter: filter,
          characters: characters,
          films: films,
        );

  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState({
    required int page,
    required CharacterFilters? filter,
    required List<Character> characters,
    required List<Film> films,
  }) : super(
          page: page,
          filter: filter,
          characters: characters,
          films: films,
        );

  @override
  List<Object> get props => [];
}

class HomeLoadedState extends HomeState {
  const HomeLoadedState({
    required int page,
    required CharacterFilters? filter,
    required List<Character> characters,
    required List<Film> films,
  }) : super(
          page: page,
          filter: filter,
          characters: characters,
          films: films,
        );

  @override
  List<Object> get props => [
        page,
        characters,
        films,
      ];
}

class HomeErrorState extends HomeState {
  const HomeErrorState({
    required int page,
    required CharacterFilters? filter,
    required List<Character> characters,
    required List<Film> films,
    required this.message,
  }) : super(
          page: page,
          filter: filter,
          characters: characters,
          films: films,
        );

  final String message;

  @override
  List<Object> get props => [
        message,
      ];
}

class FilterChangedState extends HomeState {
  const FilterChangedState({
    required int page,
    required CharacterFilters? filter,
    required List<Character> characters,
    required List<Film> films,
  }) : super(
          page: page,
          filter: filter,
          characters: characters,
          films: films,
        );

  @override
  List<Object?> get props => [
        filter,
      ];
}
