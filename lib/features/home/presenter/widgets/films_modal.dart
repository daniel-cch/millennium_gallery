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

    return SafeArea(
      top: false,
      right: false,
      left: false,
      child: Container(
        padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
        height: MediaQuery.of(context).size.height * 0.30,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          color: Constants.background,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${character.name}\'s Films',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
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
                        border: Border.all(color: Colors.white, width: 0.5),
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
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
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
