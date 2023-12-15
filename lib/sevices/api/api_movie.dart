import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_profile/models/movie.dart';

const apiKey = 'f2cf4dee03036aa9e6fe7b67466e5772';
const baseUrl = 'https://api.themoviedb.org/3';

const movieTrendingUrl =
    '$baseUrl/trending/movie/week?language=vi&api_key=$apiKey';
const moviesComingUrl =
    '$baseUrl/movie/upcoming?language=vi&page=1&api_key=$apiKey';

String searchMovies(String name) =>
    '$baseUrl/search/movie?query=$name&include_adult=false&language=vi&page=1&api_key=$apiKey';

class ApiMovies {
  static Future<List<Movie>> fetchMovies(url) async {
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final results = json['results'] as List<dynamic>;
      final movie = results.map((movie) {
        return Movie.fromMap(movie);
      }).toList();
      return movie;
    } else {
      print("Failed to fetch users.");
      return [];
    }
  }

  static Future<List<Movie>> fetchTrendingMovies() async {
    return fetchMovies(movieTrendingUrl);
  }

  static Future<List<Movie>> fetchMoviesComing() async {
    return fetchMovies(moviesComingUrl);
  }

  static Future<List<Movie>> fetchSearchMovies(String nameMovie) async {
    return fetchMovies(searchMovies(nameMovie));
  }

  static String? getImage500(String posterPath) {
    return posterPath.isNotEmpty
        ? 'https://image.tmdb.org/t/p/w500$posterPath'
        : null;
  }

  static String? getImage185(String posterPath) {
    return posterPath.isNotEmpty
        ? 'https://image.tmdb.org/t/p/w185$posterPath'
        : null;
  }
}
