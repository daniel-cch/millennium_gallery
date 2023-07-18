import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millennium_gallery/features/home/home.dart';
import 'package:millennium_gallery/shared/shared.dart';

class FilmsModal extends StatelessWidget {
  const FilmsModal({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    final films = _getFilms(context, character.films);

    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.25,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${character.name}\'s Films',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: films.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Constants.appBarBackground),
                      image: const DecorationImage(
                        image: AssetImage(Constants.rebelsPNG),
                        alignment: Alignment.topRight,
                        fit: BoxFit.none,
                        scale: 3.5,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        films[index],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<String> _getFilms(BuildContext context, List<int> characterFilms) {
    final allFilms = BlocProvider.of<HomeBloc>(context).state.films;
    List<String> films = [];

    for (var element in characterFilms) {
      final film = allFilms.firstWhere((film) => film.episodeId == element);
      films.add(film.title);
    }

    return films;
  }
}
