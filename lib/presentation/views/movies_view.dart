import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kueski_challenge/domain/repositories/movies_repo.dart';
import 'package:kueski_challenge/injection_container.dart';
import 'package:kueski_challenge/l10n/l10n.dart';
import 'package:kueski_challenge/presentation/states/cubit/movies_cubit.dart';
import 'package:kueski_challenge/presentation/widgets/movie_content.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          MoviesCubit(moviesRepo: sl<MoviesRepo>())..getPopularMovies(),
      child:
          const Scaffold(backgroundColor: Colors.black, body: MoviesContent()),
    );
  }
}

class MoviesContent extends StatefulWidget {
  const MoviesContent({super.key});

  @override
  State<MoviesContent> createState() => _MoviesContentState();
}

class _MoviesContentState extends State<MoviesContent> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        if (state is MoviesSuccess) {
          return MovieContent(movies: state.movies);
        } else if (state is MoviesError) {
          return Center(child: Text(l10n.error));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
