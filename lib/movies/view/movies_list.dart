import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_testtask/movies/bloc/movie_state.dart';

import '../bloc/movie_bloc.dart';
import '../bloc/movie_event.dart';
import '../widgets/bottom_loader.dart';
import '../widgets/movie_list_item.dart';

class MoviesList extends StatefulWidget {
  const MoviesList({Key? key}) : super(key: key);

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color(0xFF1B1934),
            Color(0xFF181A20),
            Color(0xFF1B1934)
          ])),
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          switch (state.status) {
            case MovieStatus.failure:
              return const Center(
                child: Text(
                  'failed to fetch movies',
                  style: TextStyle(color: Colors.white),
                ),
              );
            case MovieStatus.success:
              if (state.movies.isEmpty) {
                return const Center(
                  child: Text(
                    'no movies',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return index >= state.movies.length
                      ? const BottomLoader()
                      : MovieListItem(movie: state.movies[index]);
                },
                itemCount: state.hasReachedMax
                    ? state.movies.length
                    : state.movies.length + 1,
                controller: _scrollController,
              );
            case MovieStatus.initial:
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll) //повторити в яких випадках юзати ..
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<MovieBloc>().add(MovieFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
