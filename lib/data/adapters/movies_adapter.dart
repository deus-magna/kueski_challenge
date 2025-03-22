import 'package:dio/dio.dart';
import 'package:kueski_challenge/data/datasources/movies_remote_datasource.dart';
import 'package:kueski_challenge/domain/error/failure.dart';
import 'package:kueski_challenge/domain/repositories/movies_repo.dart';
import 'package:oxidized/oxidized.dart';

class MoviesAdapter extends MoviesRepo {
  MoviesAdapter({required this.moviesRemoteDataSource});

  final MoviesRemoteDataSource moviesRemoteDataSource;
  @override
  Future<Result<Unit, Failure>> getPopular({required int page}) async {
    try {
      await moviesRemoteDataSource.getPopular(page: page);

      return const Ok(unit);
    } on DioException catch (error) {
      return Result.err(Failure.fromDio(error));
    }
  }
}
