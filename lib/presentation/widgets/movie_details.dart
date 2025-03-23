import 'package:flutter/material.dart';
import 'package:kueski_challenge/core/extensions/context_extensions.dart';
import 'package:kueski_challenge/domain/entities/movies_response.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({
    required this.movie,
    required this.opacity,
    super.key,
  });

  final Movie? movie;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        _MovieTitle(movie: movie, opacity: opacity),
        _Details(movie: movie, opacity: opacity),
        _MovieOverview(movie: movie, opacity: opacity),
      ],
    );
  }
}

class _MovieTitle extends StatelessWidget {
  const _MovieTitle({
    required this.movie,
    required this.opacity,
  });

  final Movie? movie;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 800),
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
}

class _Details extends StatelessWidget {
  const _Details({
    required this.movie,
    required this.opacity,
  });

  final Movie? movie;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.white,
      fontSize: 14,
    );
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 800),
      curve: opacity == 0.0 ? Curves.easeOut : Curves.easeIn,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(movie?.getYear() ?? '', style: textStyle),
            const Text(
              '   ⬤   ',
              style: TextStyle(color: Colors.orange, fontSize: 6),
            ),
            Flexible(
              child: Text(
                context.getGenres(movie?.genreIds ?? []).join(' '),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: textStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MovieOverview extends StatelessWidget {
  const _MovieOverview({
    required this.movie,
    required this.opacity,
  });

  final Movie? movie;
  final double opacity;
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 800),
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
