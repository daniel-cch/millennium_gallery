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
          child: SizedBox(),
        );
      }

      final filteredList = Utilities.filterList(state.filter, state.characters);

      return SliverPadding(
        padding: const EdgeInsets.all(10),
        sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 1,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final character = filteredList[index];

              return CharacterCard(
                character: character,
              );
            },
            childCount: filteredList.length,
          ),
        ),
      );
    });
  }
}
