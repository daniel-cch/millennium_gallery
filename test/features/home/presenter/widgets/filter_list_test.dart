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

  testWidgets('Filter List widget Test', (tester) async {
    when(() => homeBloc.state).thenReturn(
      const HomeInitialState(
        page: 1,
        filter: null,
        characters: [],
        films: [],
      ), // the desired state
    );

    await tester.pumpWidget(
      BlocProvider<HomeBloc>(
        create: (context) => homeBloc,
        child: const MaterialApp(
          title: 'Widget Test',
          home: Scaffold(
            body: FilterList(),
          ),
        ),
      ),
    );

    final messageWidget = find.byType(SizedBox);
    expect(messageWidget, findsOneWidget);
  });

  testWidgets('Filter List widget Test', (tester) async {
    final characters = [
      const Character(
        name: 'Luke',
        gender: 'male',
        films: [1],
      ),
    ];

    when(() => homeBloc.state).thenReturn(
      HomeLoadedState(
        page: 1,
        filter: null,
        characters: characters,
        films: const [],
      ), // the desired state
    );

    await tester.pumpWidget(
      BlocProvider<HomeBloc>(
        create: (context) => homeBloc,
        child: const MaterialApp(
          title: 'Widget Test',
          home: Scaffold(
            body: FilterList(),
          ),
        ),
      ),
    );

    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(GestureDetector), findsWidgets);
    expect(find.byType(CustomChip), findsWidgets);
  });
}
