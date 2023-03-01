import 'package:equatable/equatable.dart';

import '../models/movie.dart';

enum MovieStatus {initial, success, failure}

class MovieState extends Equatable {
  const MovieState({
    this.status = MovieStatus.initial,
    this.movies = const <Movie>[],
    this.hasReachedMax = false,
  });

  final MovieStatus status;
  final List<Movie> movies;
  final bool hasReachedMax;

  //Ми реалізували copyWith, щоб ми могли скопіювати екземпляр MovieSuccess і зручно оновити нуль або більше властивостей
  MovieState copyWith({
    MovieStatus? status,
    List<Movie>? movies,
    bool? hasReachedMax,
  }) {
    return MovieState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [status, movies, hasReachedMax];
}