import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  const Movie({
    required this.posterImage,
    required this.id,
    required this.originalLanguage,
    required this.overview,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  final String posterImage;
  final int id;
  final String originalLanguage;
  final String overview;
  final String releaseDate;
  final String title;
  final dynamic voteAverage;
  final int voteCount;

  @override
  List get props => [
        posterImage,
        id,
        originalLanguage,
        overview,
        releaseDate,
        title,
        voteAverage,
        voteCount
      ];
}
