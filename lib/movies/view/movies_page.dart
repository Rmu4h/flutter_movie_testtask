
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_testtask/movies/bloc/movie_event.dart';

import '../bloc/movie_bloc.dart';
import 'package:http/http.dart' as http;

import 'movies_list.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text('Movies')
        ),
        backgroundColor: const Color(0xFF151135)
      ),
      body: BlocProvider(
        create: (_) => MovieBloc(httpClient: http.Client())..add(MovieFetched()),
        child: const MoviesList(),
      ),
    );
  }
}
