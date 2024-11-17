class Movie {
  final int? _id;
  final String? _title;
  final String? _overview;
  final String? _poster_path;

  Movie({
    int? id,
    String? title,
    String? overview,
    String? poster_path,
  })  : _id = id,
        _title = title,
        _overview = overview,
        _poster_path = poster_path;

  get poster_path => _poster_path;

  get overview => _overview;

  get title => _title;

  get id => _id;

  factory Movie.fromMap(Map<String, dynamic> movie) {
    final id = movie['id'];
    final title = movie['title'];
    final overview = movie['overview'];
    final posterPath = movie['poster_path'];
    return Movie(
      id: id,
      title: title,
      overview: overview,
      poster_path: posterPath,
    );
  }
}
