import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movies_redux/src/actions/get_movies.dart';
import 'package:movies_redux/src/containers/is_loading_container.dart';
import 'package:movies_redux/src/containers/movies_container.dart';
import 'package:movies_redux/src/models/app_state.dart';
import 'package:movies_redux/src/models/movie.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IsLoadingContainer(
      builder: (BuildContext context, bool isLoading) {
        return MoviesContainer(
          builder: (BuildContext context, List<Movie> movies) {
            return Scaffold(
              appBar: AppBar(
                actions: <Widget>[
                  if (isLoading)
                    const Center(child: CircularProgressIndicator(),)
                  else
                    IconButton(
                      onPressed: () {
                        StoreProvider.of<AppState>(context).dispatch(const GetMovies());
                      },
                      icon: const Icon(Icons.download),
                    ),
                ],
              ),
              body: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.69,
                ),
                itemCount: movies.length,
                itemBuilder: (BuildContext context, int index) {
                  final Movie movie = movies[index];
                  return SizedBox(
                    child: GridTile(
                      child: Image.network(movie.image),
                      footer: GridTileBar(
                        backgroundColor: Colors.black,
                        title: Text(movie.title),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
