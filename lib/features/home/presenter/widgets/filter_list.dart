import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millennium_gallery/features/home/home.dart';

class FilterList extends StatelessWidget {
  const FilterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.characters.isEmpty) {
          return const SizedBox();
        }

        return ListView.builder(
          primary: false,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (context, index) {
            final filter = CharacterFilters.values[index];

            return GestureDetector(
              onTap: () {
                BlocProvider.of<HomeBloc>(context).add(
                  ChangeFilterEvent(
                    filter: filter,
                  ),
                );
              },
              child: CustomChip(
                filter: filter,
                selected: _isSelected(filter, state),
              ),
            );
          },
        );
      },
    );
  }

  bool _isSelected(CharacterFilters filter, HomeState state) {
    if (state.filter == null) {
      return false;
    }

    if (filter == state.filter) {
      return true;
    }

    return false;
  }
}
