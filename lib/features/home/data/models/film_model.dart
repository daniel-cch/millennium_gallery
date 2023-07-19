import 'package:equatable/equatable.dart';
import 'package:millennium_gallery/features/home/home.dart';

class FilmModel extends Film with EquatableMixin {
  const FilmModel({
    required int episodeId,
    required String title,
  }) : super(
          episodeId: episodeId,
          title: title,
        );

  factory FilmModel.fromJson(Map<String, dynamic> json) => FilmModel(
        episodeId: json['episode_id'] ?? 0,
        title: json['title'] ?? '',
      );

  @override
  List<Object?> get props => [
        episodeId,
        title,
      ];
}
