import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kueski_challenge/domain/entities/movies_response.dart';
import 'package:kueski_challenge/presentation/states/cubit/movies_cubit.dart';
import 'package:kueski_challenge/presentation/widgets/background_image.dart';
import 'package:kueski_challenge/presentation/widgets/movie_details.dart';
import 'package:kueski_challenge/presentation/widgets/movies_page_view.dart';

class MovieContent extends StatefulWidget {
  const MovieContent({
    required this.movies,
    super.key,
  });

  final List<Movie> movies;

  @override
  State<MovieContent> createState() => _MovieContentState();
}

class _MovieContentState extends State<MovieContent> {
  Movie? _selectedMovie;
  double _opacity = 0;

  void _nextPage() => context.read<MoviesCubit>().getPopularMovies();

  Future<void> _pageChanged(Movie movie) async {
    setState(() => _opacity = 0.0);

    await Future<void>.delayed(const Duration(milliseconds: 700));

    setState(() {
      _selectedMovie = movie;
      _opacity = 1.0;
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedMovie = widget.movies.first;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(
          backgroundImage: _selectedMovie?.getPosterImg(),
          opacity: 0.75,
          animatedOpacity: _opacity,
        ),
        Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MovieDetails(movie: _selectedMovie, opacity: 1),
            MoviesPageView(
              movies: widget.movies,
              nextPage: _nextPage,
              onPageChanged: _pageChanged,
            ),
          ],
        ),
      ],
    );
  }
}
