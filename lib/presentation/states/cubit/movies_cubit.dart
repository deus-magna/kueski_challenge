import 'package:bloc/bloc.dart';
import 'package:kueski_challenge/domain/entities/movies_response.dart';
import 'package:kueski_challenge/domain/repositories/movies_repo.dart';
import 'package:meta/meta.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit({required this.moviesRepo}) : super(MoviesInitial());

  final MoviesRepo moviesRepo;
  int _page = 0;
  final List<Movie> _movies = [];

  Future<void> getPopularMovies() async {
    _page++;
    final result = await moviesRepo.getPopular(page: _page);
    result.match(
      (moviesResponse) {
        _movies.addAll(moviesResponse.movies);
        emit(MoviesSuccess(movies: _movies));
      },
      (failure) => emit(MoviesError()),
    );
  }
}
