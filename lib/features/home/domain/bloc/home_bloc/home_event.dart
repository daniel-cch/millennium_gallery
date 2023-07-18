part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class FetchDataEvent extends HomeEvent {
  const FetchDataEvent({
    required this.page,
  });

  final int page;

  @override
  List<Object?> get props => [
        page,
      ];
}

class ChangeFilterEvent extends HomeEvent {
  const ChangeFilterEvent({
    required this.filter,
  });

  final CharacterFilters filter;

  @override
  List<Object?> get props => [
        filter,
      ];
}
