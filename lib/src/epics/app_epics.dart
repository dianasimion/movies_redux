import 'package:movies_redux/src/actions/index.dart';
import 'package:movies_redux/src/data/movies_api.dart';
import 'package:movies_redux/src/models/app_state.dart';
import 'package:movies_redux/src/models/movie.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class AppEpic {
  const AppEpic({required MoviesApi moviesApi})
      : _moviesApi = moviesApi;
  final MoviesApi _moviesApi;

  Epic<AppState> get epic {
    return combineEpics(<Epic<AppState>>[
      TypedEpic<AppState, GetMoviesStart>(_getMovies),
    ]);
  }

  Stream<AppAction> _getMovies(Stream<GetMoviesStart> actions, EpicStore<AppState> store) {
    return actions
        .asyncMap((GetMoviesStart action) => _moviesApi.getMovies(store.state.page))
        .map((List<Movie> movies) => GetMovies.successful(movies))
        .onErrorReturnWith((Object error, StackTrace stackTrace) => GetMovies.error(error, stackTrace));
  }
}