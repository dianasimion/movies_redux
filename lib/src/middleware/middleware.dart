import 'package:movies_redux/src/actions/get_movies.dart';
import 'package:movies_redux/src/data/movies_api.dart';
import 'package:movies_redux/src/models/app_state.dart';
import 'package:movies_redux/src/models/movie.dart';
import 'package:redux/redux.dart';

class AppMiddleware {
  const AppMiddleware({required MoviesApi moviesApi}) : _moviesApi = moviesApi;

  final MoviesApi _moviesApi;

  List<Middleware<AppState>> get middleware {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, GetMovies>(_getMovies),
    ];
  }

  Future<void> _getMovies(Store<AppState> store, GetMovies action, NextDispatcher next) async {
    next(action);
    try {
      final List<Movie> movies = await _moviesApi.getMovies(store.state.page);
      store.dispatch(GetMoviesSuccessful(movies));
    } catch (error) {
      store.dispatch(GetMoviesError(error));
      print(error);
    }
  }
}