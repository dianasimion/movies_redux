library actions;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_redux/src/models/movie.dart';

part 'get_movies.dart';
part 'index.freezed.dart';

abstract class AppAction {}

abstract class ErrorAction implements AppAction {
  Object get error;

  StackTrace get stackTrace;
}