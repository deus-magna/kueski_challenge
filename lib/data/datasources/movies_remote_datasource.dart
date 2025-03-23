import 'package:dio/dio.dart';
import 'package:kueski_challenge/data/models/genre_response_model.dart';
import 'package:kueski_challenge/data/models/movies_response_model.dart';

abstract class MoviesRemoteDataSource {
  Future<MoviesResponseModel> getPopular({int page = 1});

  Future<GenreResponseModel> getGenreList();
}

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  MoviesRemoteDataSourceImpl({required this.dio});
  final Dio dio;

  @override
  Future<MoviesResponseModel> getPopular({int page = 1}) async {
    final response = await dio.get<dynamic>(
      '/discover/movie',
      queryParameters: {
        'api_key': const String.fromEnvironment('apiKey'),
        'include_adult': false,
        'include_video': false,
        'language': 'en-US',
        'page': page,
        'sort_by': 'popularity.desc',
      },
    );
    return MoviesResponseModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<GenreResponseModel> getGenreList() async {
    final response = await dio.get<dynamic>(
      '/genre/movie/list',
      queryParameters: {
        'api_key': const String.fromEnvironment('apiKey'),
        'language': 'en-US',
      },
    );

    return GenreResponseModel.fromJson(response.data as Map<String, dynamic>);
  }
}
