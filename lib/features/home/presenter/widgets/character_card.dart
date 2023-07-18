import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millennium_gallery/features/home/home.dart';
import 'package:millennium_gallery/shared/shared.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          builder: (_) {
            return BlocProvider.value(
              value: BlocProvider.of<HomeBloc>(context),
              child: Builder(builder: (context) {
                return FilmsModal(
                  character: character,
                );
              }),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Constants.appBarBackground),
          image: const DecorationImage(
            image: AssetImage(Constants.empirePNG),
            alignment: Alignment.bottomLeft,
            fit: BoxFit.none,
            scale: 5,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                character.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              const Text('Gender'),
              Text(
                character.gender,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              const Text('Films'),
              Text(
                character.films.length.toString(),
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
