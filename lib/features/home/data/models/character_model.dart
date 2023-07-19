import 'package:equatable/equatable.dart';
import 'package:millennium_gallery/features/home/home.dart';
import 'package:millennium_gallery/shared/shared.dart';

class CharacterModel extends Character with EquatableMixin {
  const CharacterModel({
    required String name,
    required String gender,
    required List<int> films,
  }) : super(
          name: name,
          gender: gender,
          films: films,
        );

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    var films = List.from(json['films'])
        .map((item) => Utilities.getIdFromFilm(item))
        .toList();

    return CharacterModel(
      name: json['name'] ?? '',
      gender: json['gender'] ?? '',
      films: films,
    );
  }

  @override
  List<Object?> get props => [
        name,
        gender,
        films,
      ];
}
