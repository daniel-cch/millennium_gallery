import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:millennium_gallery/features/home/home.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc()
      : super(
          const HomeInitialState(
            filter: null,
          ),
        ) {
    on<ChangeFilterEvent>(_changeFilterEvent);
  }

  void _changeFilterEvent(ChangeFilterEvent event, Emitter emit) {
    if (event.filter == state.filter) {
      emit(
        const FilterChangedState(
          filter: null,
        ),
      );

      return;
    }

    emit(
      FilterChangedState(
        filter: event.filter,
      ),
    );
  }
}
