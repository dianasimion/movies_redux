import 'package:movies_redux/src/actions/get_movies.dart';
import 'package:movies_redux/src/models/app_state.dart';
import 'package:redux/redux.dart';

Reducer<AppState> reducer = combineReducers(<Reducer<AppState>>[
  TypedReducer<AppState, GetMoviesSuccessful>(_getMoviesSuccessful),
  TypedReducer<AppState, GetMovies>(_getMovies),
  TypedReducer<AppState, GetMoviesError>(_getMoviesError),
]);

AppState _getMovies(AppState state, GetMovies action) {
  return state.rebuild((AppStateBuilder b) {
    b.isLoading = true;
  });
}

AppState _getMoviesSuccessful(AppState state, GetMoviesSuccessful action) {
  return state.rebuild((AppStateBuilder b) {
    print('page is now: ${state.page + 1}');
    b
      ..movies.addAll(action.movies)
      ..isLoading = false
      ..page = state.page + 1;
  });
}

AppState _getMoviesError(AppState state, GetMoviesError action) {
  return state.rebuild((AppStateBuilder b) {
    b.isLoading = false;
  });
}
