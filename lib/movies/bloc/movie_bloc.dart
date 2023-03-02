import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_movie_testtask/movies/bloc/movie_state.dart';
import 'package:stream_transform/stream_transform.dart';

import '../models/movie.dart';
import 'movie_event.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) { //хуйня з пекеджу bloc_concurrency дозволяє працювати з ember-concurrency
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class MovieBloc extends Bloc<MovieEvent, MovieState>{
  MovieBloc({required this.httpClient}) : super(const MovieState()) {
    //register on<MovieFetched> event
    on<MovieFetched>(
        _onMovieFetched,
        transformer: throttleDroppable(throttleDuration),
    );
  }

  final http.Client httpClient;

  Future<void> _onMovieFetched(MovieFetched event, Emitter<MovieState> emit) async {
    if(state.hasReachedMax) return;
    try{
      print('${state.status} -зашло');
      if (state.status == MovieStatus.initial) {
        print('тут працює1');

        final movies = await _fetchMovies();
        print('тут працює');
        return emit(state.copyWith(
          status: MovieStatus.success,
          movies: movies,
          hasReachedMax: false,
        ));
      }
      final movies = await _fetchMovies(state.movies.length);
       print('_onMovieFetched movies');
      // emit(movies.isEmpty
      //   ? state.copyWith(hasReachedMax: true)
      //   : state.copyWith(
      //     status: MovieStatus.success,
      //     movies: List.of(state.movies)..addAll(movies),
      //     hasReachedMax: false,
      //   )
      // );

      movies.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
        state.copyWith(
          status: MovieStatus.success,
          movies: List.of(state.movies)..addAll(movies),
          hasReachedMax: false,
        ),
      );
    } catch (_) {
      print('catch work');
      emit(state.copyWith(status: MovieStatus.failure));
    }
  }

  Future<List<Movie>> _fetchMovies([int startIndex = 0]) async {
    final response = await httpClient.get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=bda761415e0345e74e087e4d72e7a7d2'));
    print('$response - print response');
    print(response.statusCode);
    if(response.statusCode == 200) {
      print('тру');
      final body = json.decode(response.body)['results'] as List;

      print('$body - print body');

      return body.map((dynamic json) {
        final map = json as Map<String, dynamic>;
        print('$map - print map');

        return Movie(
          posterImage: 'https://image.tmdb.org/t/p/w500/' + map['backdrop_path'],
          id: map['id'] as int,
          originalLanguage: map['original_language'] as String,
          overview: map['overview'] as String,
          releaseDate: map['release_date'] as String,
          title: map['title'] as String,
          voteAverage: map['vote_average'],
          voteCount: map['vote_count'] as int,
        );
      }).toList();
    }
    throw Exception('error fetching movies');
  }
}