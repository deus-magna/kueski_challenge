import 'package:bloc/bloc.dart';
import 'package:kueski_challenge/domain/repositories/movies_repo.dart';
import 'package:meta/meta.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit({required this.moviesRepo}) : super(MoviesInitial());

  final MoviesRepo moviesRepo;

  Future<void> getPopularMovies({int page = 1}) async {
    final result = await moviesRepo.getPopular(page: page);
    result.match(
      (moviesResponse) {
        emit(MoviesSuccess());
      },
      (failure) => emit(MoviesError()),
    );
  }
}
