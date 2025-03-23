import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kueski_challenge/domain/entities/movies_response.dart';
import 'package:kueski_challenge/domain/repositories/movies_repo.dart';
import 'package:kueski_challenge/injection_container.dart';
import 'package:kueski_challenge/l10n/l10n.dart';
import 'package:kueski_challenge/presentation/states/cubit/movies_cubit.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          MoviesCubit(moviesRepo: sl<MoviesRepo>())..getPopularMovies(),
      child: Scaffold(body: const MoviesContent()),
    );
  }
}

class MoviesContent extends StatelessWidget {
  const MoviesContent({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        if (state is MoviesSuccess) {
          return MoviesPageView(
              movies: state.movies,
              nextPage: () {
                print('has next call');
                context.read<MoviesCubit>().getPopularMovies();
              });
        } else if (state is MoviesError) {
          return const Center(
            child: Text('Ha ocurrido un error intenta de nuevo...'),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class MoviesPageView extends StatelessWidget {
  MoviesPageView({
    required this.movies,
    required this.nextPage,
    super.key,
  });

  final List<Movie> movies;
  final void Function() nextPage;

  final _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.3,
  );

  Widget _card(BuildContext context, Movie movie) {
    final movieCard = Container(
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        children: <Widget>[
          Hero(
            tag: movie.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(movie.getPosterImg()),
                placeholder: MemoryImage(Uint8List(0)),
                fit: BoxFit.cover,
                height: 160,
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            movie.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12.0,
            ),
          )
        ],
      ),
    );

    return GestureDetector(
      child: movieCard,
      onTap: () {
        Navigator.pushNamed(context, 'detalle', arguments: movie);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if (_pageController.position.pixels ==
          _pageController.position.maxScrollExtent) {
        nextPage();
      }
    });

    return SizedBox(
      height: screenSize.height * 0.3,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        itemCount: movies.length,
        itemBuilder: (context, index) => _card(context, movies[index]),
      ),
    );
  }
}
