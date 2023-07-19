import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:millennium_gallery/features/home/home.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

class FakeHomeEvent extends Fake implements HomeEvent {}

class FakeHomeState extends Fake implements HomeState {}

void main() {
  final MockHomeBloc homeBloc = MockHomeBloc();

  setUpAll(() {
    registerFallbackValue(FakeHomeEvent());
    registerFallbackValue(FakeHomeState());
  });

  testWidgets('Films modal widget Test', (tester) async {
    final characters = [
      const Character(
        name: 'Luke',
        gender: 'male',
        films: [1],
      ),
    ];

    final films = [
      const Film(
        episodeId: 1,
        title: 'The Phantom Menace',
      ),
    ];

    when(() => homeBloc.state).thenReturn(
      HomeLoadedState(
        page: 1,
        filter: null,
        characters: characters,
        films: films,
      ), // the desired state
    );

    await tester.pumpWidget(
      BlocProvider<HomeBloc>(
        create: (context) => homeBloc,
        child: MaterialApp(
          title: 'Widget Test',
          home: Scaffold(
            body: FilmsModal(
              character: characters.first,
            ),
          ),
        ),
      ),
    );

    Text text = tester.firstWidget(find.byType(Text));

    expect(find.byType(SafeArea), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(text.data, 'Luke\'s Films');
    expect(find.byType(ListView), findsOneWidget);
  });
}
