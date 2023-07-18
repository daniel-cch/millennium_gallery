import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millennium_gallery/features/home/home.dart';
import 'package:millennium_gallery/shared/shared.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is HomeLoadingState && state.characters.isEmpty) {
        return const SliverToBoxAdapter(
          child: Center(
            child: SizedBox(
              width: 80,
              height: 80,
              child: CircularProgressIndicator(),
            ),
          ),
        );
      }

      final filteredList = Utilities.filterList(state.filter, state.characters);

      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final character = filteredList[index];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 80,
                alignment: Alignment.center,
                child: Text(
                  '${character.name}, ${character.gender}, ${character.films.length}',
                ),
              ),
            );
          },
          childCount: filteredList.length,
        ),
      );
    });
  }
}
