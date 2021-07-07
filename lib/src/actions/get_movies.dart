import 'package:movies_redux/src/models/movie.dart';

class GetMovies {
  const GetMovies();
}

class GetMoviesSuccessful {
  GetMoviesSuccessful(this.movies);

  final List<Movie> movies;

  @override
  String toString() {
    return 'GetMoviesSuccessful{movies: $movies}';
  }
}

class GetMoviesError {
  GetMoviesError(this.error);

  final dynamic error;

  @override
  String toString() {
    return 'GetMoviesError{error: $error}';
  }
}
