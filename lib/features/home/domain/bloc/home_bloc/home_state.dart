part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState({
    required this.filter,
  });

  final CharacterFilters? filter;

  @override
  List<Object?> get props => [
        filter,
      ];
}

class HomeInitialState extends HomeState {
  const HomeInitialState({
    required CharacterFilters? filter,
  }) : super(filter: filter);

  @override
  List<Object> get props => [];
}

class FilterChangedState extends HomeState {
  const FilterChangedState({
    required CharacterFilters? filter,
  }) : super(filter: filter);

  @override
  List<Object?> get props => [
        filter,
      ];
}
