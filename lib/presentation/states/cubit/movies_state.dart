part of 'movies_cubit.dart';

sealed class MoviesState {}

final class MoviesInitial extends MoviesState {}

final class MoviesLoading extends MoviesState {}

final class MoviesSuccess extends MoviesState {
  MoviesSuccess({required this.movies});

  final List<Movie> movies;
}

final class MoviesError extends MoviesState {}
