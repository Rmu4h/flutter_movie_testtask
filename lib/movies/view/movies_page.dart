import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_testtask/movies/bloc/movie_event.dart';

import '../bloc/movie_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

import 'movies_list.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
              child: Text(
                  'Movies',
                  style: GoogleFonts.alike(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
              )),
          backgroundColor: const Color(0xFF151135)),
      body: BlocProvider(
        create: (_) =>
            MovieBloc(httpClient: http.Client())..add(MovieFetched()),
        child: const MoviesList(),
      ),
    );
  }
}
