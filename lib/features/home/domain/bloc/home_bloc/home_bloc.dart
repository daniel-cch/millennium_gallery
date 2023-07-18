import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:millennium_gallery/features/home/home.dart';
import 'package:millennium_gallery/shared/shared.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc()
      : super(
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

  final StarWarsRepository _repository = ApiStarWars();

  Future<void> _fetchDataEvent(FetchDataEvent event, Emitter emit) async {
    emit(
      HomeLoadingState(
        page: state.page,
        filter: state.filter,
        characters: state.characters,
        films: state.films,
      ),
    );

    final characters = await _repository.getCharacters(page: state.page);
    final films = await _repository.getFilms();

    final characterFold = characters.fold((error) => error, (r) => r);
    final filmsFold = films.fold((error) => error, (r) => r);

    if (characterFold is AppError || filmsFold is AppError) {
      emit(
        HomeErrorState(
          page: state.page,
          filter: state.filter,
          characters: state.characters,
          films: state.films,
          message: 'Error Fetching Data',
        ),
      );
      return;
    }

    emit(
      HomeLoadedState(
        page: state.page,
        filter: state.filter,
        characters: characterFold as List<Character>,
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
