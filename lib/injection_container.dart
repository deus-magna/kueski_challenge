import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kueski_challenge/data/adapters/movies_adapter.dart';
import 'package:kueski_challenge/data/datasources/movies_remote_datasource.dart';
import 'package:kueski_challenge/domain/repositories/movies_repo.dart';

final sl = GetIt.instance;

/// Init the dependency injection rules
Future<void> init() async {
  sl
    // Repos
    ..registerLazySingleton<MoviesRepo>(
      () => MoviesAdapter(
        moviesRemoteDataSource: sl<MoviesRemoteDataSource>(),
      ),
    )
    // Datasources
    ..registerLazySingleton<MoviesRemoteDataSource>(
      () => MoviesRemoteDataSourceImpl(dio: sl<Dio>()),
    )
    // Core
    ..registerLazySingleton(
      () => Dio(
        BaseOptions(
          baseUrl: const String.fromEnvironment('baseUrl', defaultValue: '-'),
          connectTimeout: const Duration(milliseconds: 15000),
          contentType: 'application/x-www-form-urlencoded',
        ),
      ),
    );
}
