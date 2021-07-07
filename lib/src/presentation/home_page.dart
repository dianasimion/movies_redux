import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_redux/src/containers/movies_container.dart';
import 'package:movies_redux/src/models/movie.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MoviesContainer(builder: (BuildContext context, List<Movie> movies) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.69),
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
              ));
        },
      );
    });
  }
}
