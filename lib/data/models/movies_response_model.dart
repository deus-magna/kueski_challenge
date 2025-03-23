import 'package:kueski_challenge/domain/entities/movies_response.dart';

class MoviesResponseModel extends MoviesResponse {
  const MoviesResponseModel({
    required super.page,
    required super.movies,
    required super.totalPages,
    required super.totalResults,
  });

  factory MoviesResponseModel.fromJson(Map<String, dynamic> json) =>
      MoviesResponseModel(
        page: json['page'] == null ? 0 : json['page'] as int,
        movies: json['results'] == null
            ? []
            : List<MovieModel>.from(
                (json['results'] as List).map(
                  (x) => MovieModel.fromJson(x as Map<String, dynamic>),
                ),
              ),
        totalPages:
            json['total_pages'] == null ? 0 : json['total_pages'] as int,
        totalResults:
            json['total_results'] == null ? 0 : json['total_results'] as int,
      );
}

class MovieModel extends Movie {
  const MovieModel({
    required super.backdropPath,
    required super.genreIds,
    required super.id,
    required super.originalLanguage,
    required super.originalTitle,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required super.releaseDate,
    required super.title,
    required super.voteAverage,
    required super.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        backdropPath: json['backdrop_path'] == null
            ? ''
            : json['backdrop_path'] as String,
        originalLanguage: json['original_language'] == null
            ? ''
            : json['original_language'] as String,
        originalTitle: json['original_title'] == null
            ? ''
            : json['original_title'] as String,
        overview: json['overview'] == null ? '' : json['overview'] as String,
        posterPath:
            json['poster_path'] == null ? '' : json['poster_path'] as String,
        title: json['title'] == null ? '' : json['title'] as String,
        voteCount: json['vote_count'] == null ? 0 : json['vote_count'] as int,
        id: json['id'] == null ? 0 : json['id'] as int,
        releaseDate: json['release_date'] == null
            ? DateTime.now()
            : DateTime.parse(json['release_date'] as String),
        popularity:
            json['popularity'] == null ? 0 : json['popularity'] as double,
        voteAverage:
            json['vote_average'] == null ? 0 : json['vote_average'] as double,
        genreIds: List<int>.from((json['genre_ids'] as List).map((x) => x)),
      );
}
