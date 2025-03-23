import 'package:bloc/bloc.dart';
import 'package:kueski_challenge/domain/entities/genre_response.dart';
import 'package:kueski_challenge/domain/entities/movies_response.dart';
import 'package:kueski_challenge/domain/repositories/movies_repo.dart';
import 'package:meta/meta.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit({required this.moviesRepo}) : super(MoviesInitial()) {
    getGenreList();
  }

  final MoviesRepo moviesRepo;
  int _page = 0;
  final List<Movie> _movies = [];
  final List<Genre> genres = [];

  Future<void> getPopularMovies() async {
    print('nextpage');
    _page++;
    final result = await moviesRepo.getPopular(page: _page);
    result.match(
      (moviesResponse) {
        print('adding movies');
        _movies.addAll(moviesResponse.movies);
        emit(MoviesSuccess(movies: _movies));
      },
      (failure) {
        print('error');
        emit(MoviesError());
      },
    );
  }

  Future<void> getGenreList() async {
    _page++;
    final result = await moviesRepo.getGenreList();
    result.match(
      (genreResponse) {
        genres.addAll(genreResponse.genres);
      },
      (failure) {},
    );
  }
}
