import 'package:dio/dio.dart';

abstract class MoviesRemoteDataSource {
  Future<void> getPopular({int page = 1});
}

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  MoviesRemoteDataSourceImpl({required this.dio});
  final Dio dio;
  final String baseUrl = 'https://api.themoviedb.org/3/discover/movie';
  final String apiKey = 'YOUR_API_KEY';

  @override
  Future<void> getPopular({int page = 1}) async {
    try {
      final response = await dio.get<dynamic>(
        baseUrl,
        queryParameters: {
          'api_key': apiKey,
          'include_adult': false,
          'include_video': false,
          'language': 'en-US',
          'page': page,
          'sort_by': 'popularity.desc',
        },
      );
      print(response.data);
    } catch (e) {
      throw Exception('Failed to fetch popular movies: $e');
    }
  }
}
