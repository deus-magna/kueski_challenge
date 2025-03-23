import 'package:equatable/equatable.dart';

class MoviesResponse extends Equatable {
  const MoviesResponse({
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<Movie> movies;
  final int totalPages;
  final int totalResults;

  @override
  List<Object?> get props => [page, movies, totalPages, totalResults];
}

class Movie extends Equatable {
  const Movie({
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime releaseDate;
  final String title;
  final double voteAverage;
  final int voteCount;

  String getPosterImg() {
    if (posterPath == '') {
      return 'http://www.independentmediators.co.uk/wp-content/uploads/2016/02/placeholder-image.jpg';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }
  }

  String getBackgroundImg() {
    if (backdropPath == '') {
      return 'http://www.independentmediators.co.uk/wp-content/uploads/2016/02/placeholder-image.jpg';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$backdropPath';
    }
  }

  @override
  List<Object?> get props => [
        backdropPath,
        genreIds,
        id,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        voteAverage,
        voteCount,
      ];
}
