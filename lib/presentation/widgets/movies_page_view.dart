import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kueski_challenge/domain/entities/movies_response.dart';
import 'package:shimmer/shimmer.dart';

class MoviesPageView extends StatelessWidget {
  MoviesPageView({
    required this.movies,
    required this.nextPage,
    required this.onPageChanged,
    super.key,
  });

  final List<Movie> movies;
  final void Function() nextPage;
  final void Function(Movie) onPageChanged;

  final _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.4,
  );

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if (_pageController.position.pixels ==
          _pageController.position.maxScrollExtent) {
        print('next page');
        nextPage();
      }
    });

    return SizedBox(
      height: screenSize.height * 0.3,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        itemCount: movies.length,
        itemBuilder: (context, index) => _MovieCard(movie: movies[index]),
        onPageChanged: (value) => onPageChanged(movies[value]),
      ),
    );
  }
}

class _MovieCard extends StatelessWidget {
  const _MovieCard({required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl: movie.getPosterImg(),
              fit: BoxFit.cover,
              height: 200,
              progressIndicatorBuilder: (context, url, progress) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 200,
                    width: 135,
                    color: Colors.white,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 5),
          Text(
            movie.title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
