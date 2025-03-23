import 'package:dio/dio.dart';
import 'package:kueski_challenge/data/models/movies_response_model.dart';

abstract class MoviesRemoteDataSource {
  Future<MoviesResponseModel> getPopular({int page = 1});
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
    print(response.data);
    return MoviesResponseModel.fromJson(response.data as Map<String, dynamic>);
  }
}
