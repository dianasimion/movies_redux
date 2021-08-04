import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:movies_redux/src/actions/index.dart';
import 'package:movies_redux/src/data/movies_api.dart';
import 'package:movies_redux/src/epics/app_epics.dart';
import 'package:movies_redux/src/models/app_state.dart';
import 'package:movies_redux/src/presentation/home_page.dart';
import 'package:movies_redux/src/reducer/reducer.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

void main() {
  final Client client = Client();
  final MoviesApi moviesApi = MoviesApi(client: client);
  final AppEpic appEpic = AppEpic(moviesApi: moviesApi);
  final Store<AppState> store = Store<AppState>(reducer,
      initialState: AppState(), middleware: <Middleware<AppState>>[EpicMiddleware<AppState>(appEpic.epic)]);

  store.dispatch(const GetMovies());
  runApp(MovieApp(store: store));
}

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key, required this.store}) : super(key: key);
  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        home: const MyHomePage(),
        theme: ThemeData.dark(),
      ),
    );
  }
}
