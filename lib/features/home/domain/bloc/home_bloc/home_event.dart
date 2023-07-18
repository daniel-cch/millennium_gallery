part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
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
