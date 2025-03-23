import 'package:flutter/material.dart';
import 'package:kueski_challenge/domain/entities/movies_response.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({
    // required this.genres,
    // required this.actors,
    required this.movie,
    required this.opacity,
    super.key,
  });

  // final List<Genre> genres;
  // final List<Actor> actors;
  final Movie? movie;
  final double opacity;

  static const _duration = Duration(milliseconds: 800);

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        _buildMovieTitle(context),
        _buildMovieDetails(),
        _buildMovieCast(),
        _buildMovieOverview(context),
      ],
    );
  }

  Widget _buildMovieCast() {
    return AnimatedOpacity(
      opacity: opacity,
      duration: _duration,
      curve: opacity == 0.0 ? Curves.easeOut : Curves.easeIn,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          'utils.getActors(actors),',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildMovieDetails() {
    return AnimatedOpacity(
      opacity: opacity,
      duration: _duration,
      curve: opacity == 0.0 ? Curves.easeOut : Curves.easeIn,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              movie?.getYear() ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const Text(
              '   ⬤   ',
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 6,
              ),
            ),
            const Flexible(
              child: Text(
                'utils.getGenresFromId(movie.genreIds, genres)',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieTitle(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: _duration,
      curve: opacity == 0.0 ? Curves.easeOut : Curves.easeIn,
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.07389,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          movie?.title.toUpperCase() ?? '',
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildMovieOverview(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: _duration,
      curve: opacity == 0.0 ? Curves.easeOut : Curves.easeIn,
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.18,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          movie?.overview ?? '',
          maxLines: 8,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
