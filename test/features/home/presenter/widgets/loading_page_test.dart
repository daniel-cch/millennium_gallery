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

  testWidgets('LoadingPage widget Test', (tester) async {
    final characters = [
      const Character(
        name: 'Luke',
        gender: 'male',
        films: [1],
      ),
    ];

    when(() => homeBloc.state).thenReturn(
      HomeLoadingState(
        page: 2,
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
            body: CustomScrollView(
              slivers: [
                LoadingPage(),
              ],
            ),
          ),
        ),
      ),
    );

    final messageWidget = find.byType(CircularProgressIndicator);
    expect(messageWidget, findsOneWidget);
  });

  testWidgets('LoadingPage widget Test', (tester) async {
    final characters = [
      const Character(
        name: 'Luke',
        gender: 'male',
        films: [1],
      ),
    ];

    when(() => homeBloc.state).thenReturn(
      HomeLoadingState(
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
            body: CustomScrollView(
              slivers: [
                LoadingPage(),
              ],
            ),
          ),
        ),
      ),
    );

    final messageWidget = find.byType(SizedBox);
    expect(messageWidget, findsOneWidget);
  });
}
