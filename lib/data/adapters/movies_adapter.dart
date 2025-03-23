import 'package:dio/dio.dart';
import 'package:kueski_challenge/data/datasources/movies_remote_datasource.dart';
import 'package:kueski_challenge/domain/entities/movies_response.dart';
import 'package:kueski_challenge/domain/error/failure.dart';
import 'package:kueski_challenge/domain/repositories/movies_repo.dart';
import 'package:oxidized/oxidized.dart';

class MoviesAdapter extends MoviesRepo {
  MoviesAdapter({required this.moviesRemoteDataSource});

  final MoviesRemoteDataSource moviesRemoteDataSource;
  @override
  Future<Result<MoviesResponse, Failure>> getPopular({
    required int page,
  }) async {
    try {
      final movies = await moviesRemoteDataSource.getPopular(page: page);

      return Ok(movies);
    } on DioException catch (error) {
      return Result.err(Failure.fromDio(error));
    }
  }
}
