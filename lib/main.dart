import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_testtask/simple_bloc_observer.dart';

import 'app.dart';

void main() {
  Bloc.observer = const SimpleBlocObserver();
  runApp(const App());
}
