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

  testWidgets('Character List widget Test', (tester) async {
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
            body: CharacterCard(
              character: characters.first,
            ),
          ),
        ),
      ),
    );

    expect(find.byType(CharacterCard), findsOneWidget);
    expect(find.byType(InkWell), findsOneWidget);
    expect(find.byType(CharacterCard), findsWidgets);
    expect(find.text('Luke'), findsOneWidget);
    expect(find.text('male'), findsOneWidget);
    expect(find.text('1'), findsOneWidget);
  });
}
