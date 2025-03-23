import 'package:equatable/equatable.dart';

class GenreResponse extends Equatable {
  const GenreResponse({required this.genres});

  final List<Genre> genres;

  @override
  List<Object?> get props => [genres];
}

class Genre extends Equatable {
  Genre({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  @override
  List<Object?> get props => [id, name];
}
