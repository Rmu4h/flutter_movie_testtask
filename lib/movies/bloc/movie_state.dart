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

  //We implemented copyWith so that we can copy an instance of PostSuccess and update zero or more properties conveniently
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