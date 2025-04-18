import 'package:kueski_challenge/domain/entities/genre_response.dart';
import 'package:kueski_challenge/domain/entities/movies_response.dart';
import 'package:kueski_challenge/domain/error/error.dart';
import 'package:oxidized/oxidized.dart';

abstract class MoviesRepo {
  /// get popular movies
  Future<Result<MoviesResponse, Failure>> getPopular({required int page});

  /// get the list of genre for the movies
  Future<Result<GenreResponse, Failure>> getGenreList();
}
