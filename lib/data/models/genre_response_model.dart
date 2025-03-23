import 'package:kueski_challenge/domain/entities/genre_response.dart';

class GenreResponseModel extends GenreResponse {
  const GenreResponseModel({required super.genres});

  factory GenreResponseModel.fromJson(Map<String, dynamic> json) =>
      GenreResponseModel(
        genres: List<GenreModel>.from(
          (json['genres'] as List)
              .map((x) => GenreModel.fromJson(x as Map<String, dynamic>)),
        ),
      );
}

class GenreModel extends Genre {
  const GenreModel({
    required super.id,
    required super.name,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        id: json['id'] as int,
        name: json['name'] as String,
      );
}
