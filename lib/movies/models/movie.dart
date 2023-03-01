import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterImage,
    required this.voteAverage,
    required this.voteCount,
    required this.releaseDate,
    required this.originalLanguage,
  });

  final int id;
  final String title;
  final String overview;
  final String posterImage;
  final double voteAverage;
  final int voteCount;
  final String releaseDate;
  final String originalLanguage;

  @override
  List<Object> get props => [id, title, overview, posterImage, voteAverage, voteCount, releaseDate, originalLanguage];
}