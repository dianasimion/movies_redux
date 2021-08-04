import 'dart:convert';
import 'package:http/http.dart';
import 'package:movies_redux/src/models/index.dart';

class MoviesApi {
  const MoviesApi({required Client client}) : _client = client;

  final Client _client;

  Future<List<Movie>> getMovies(int page) async {
    final Uri url = Uri(
      scheme: 'https', //
      host: 'yts.mx',
      pathSegments: <String>['api', 'v2', 'list_movies.json'],
      queryParameters: <String, String>{
        'limit': '20',
        'page': '$page',
      },
    );

    final Response response = await _client.get(url);

    final Map<String, dynamic> body = jsonDecode(response.body) as Map<String, dynamic>;
    final Map<String, dynamic> dataMap = body['data'] as Map<String, dynamic>;
    final List<dynamic> movies = dataMap['movies'] as List<dynamic>;

    return movies //
        .map((dynamic json) => Movie.fromJson(json))
        .toList();
  }
}
