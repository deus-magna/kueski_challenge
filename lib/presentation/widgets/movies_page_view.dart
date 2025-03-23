import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kueski_challenge/domain/entities/movies_response.dart';
import 'package:shimmer/shimmer.dart';

class MoviesPageView extends StatefulWidget {
  const MoviesPageView({
    required this.movies,
    required this.nextPage,
    required this.onPageChanged,
    super.key,
  });

  final List<Movie> movies;
  final void Function() nextPage;
  final void Function(Movie) onPageChanged;

  @override
  State<MoviesPageView> createState() => _MoviesPageViewState();
}

class _MoviesPageViewState extends State<MoviesPageView> {
  final _pageController = PageController(
    viewportFraction: 0.4,
  );
  int _selectedIndex = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      if (_pageController.position.pixels ==
          _pageController.position.maxScrollExtent) {
        widget.nextPage();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: screenSize.height * 0.3,
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.movies.length,
        itemBuilder: (context, index) => _MovieCard(
          movie: widget.movies[index],
          isSelected: index == _selectedIndex,
        ),
        onPageChanged: (value) {
          if (value < widget.movies.length) {
            _selectedIndex = value;
            widget.onPageChanged(widget.movies[value]);
          }
        },
      ),
    );
  }
}

class _MovieCard extends StatelessWidget {
  const _MovieCard({
    required this.movie,
    required this.isSelected,
  });

  final Movie movie;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 2,
                color: isSelected ? Colors.orange : Colors.transparent,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
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
          ),
          const SizedBox(height: 5),
          Text(
            movie.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: isSelected ? Colors.orange : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
