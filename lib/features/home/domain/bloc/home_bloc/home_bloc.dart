import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:millennium_gallery/core/core.dart';
import 'package:millennium_gallery/features/home/home.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required StarWarsRepository starWarsRepository})
      : _repository = starWarsRepository,
        super(
          const HomeInitialState(
            page: 1,
            filter: null,
            characters: [],
            films: [],
          ),
        ) {
    on<ChangeFilterEvent>(_changeFilterEvent);
    on<FetchDataEvent>(_fetchDataEvent);
  }

  final StarWarsRepository _repository;

  Future<void> _fetchDataEvent(
    FetchDataEvent event,
    Emitter emit,
  ) async {
    emit(
      HomeLoadingState(
        page: event.page,
        filter: state.filter,
        characters: state.characters,
        films: state.films,
      ),
    );

    final characters = await _repository.getCharacters(page: event.page);
    final films = await _repository.getFilms();

    final characterFold = characters.fold(
      (error) => error,
      (characters) => characters,
    );
    final filmsFold = films.fold(
      (error) => error,
      (films) => films,
    );

    if (characterFold is AppError || filmsFold is AppError) {
      emit(
        HomeErrorState(
          page: event.page - 1,
          filter: state.filter,
          characters: state.characters,
          films: state.films,
          message: 'Error Fetching Data',
        ),
      );
      return;
    }

    List<Character> chars = [];
    chars.addAll(state.characters);
    chars.addAll(characterFold as List<Character>);

    emit(
      HomeLoadedState(
        page: event.page,
        filter: state.filter,
        characters: chars,
        films: filmsFold as List<Film>,
      ),
    );
  }

  void _changeFilterEvent(ChangeFilterEvent event, Emitter emit) {
    if (event.filter == state.filter) {
      emit(
        FilterChangedState(
          page: state.page,
          filter: null,
          characters: state.characters,
          films: state.films,
        ),
      );

      return;
    }

    emit(
      FilterChangedState(
        page: state.page,
        filter: event.filter,
        characters: state.characters,
        films: state.films,
      ),
    );
  }
}
