import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cinema_wisdom/config/helpers/human_formats.dart';
import 'package:cinema_wisdom/domain/entities/movie.dart';

typedef SearchMoviesCallBack = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final SearchMoviesCallBack searchMovies;
  List<Movie> initialMovies;

  StreamController<List<Movie>> currentSearchedMovies =
      StreamController.broadcast();
  StreamController<bool> isLoading = StreamController.broadcast();
  Timer? _debounceTimer;

  SearchMovieDelegate({
    required this.searchMovies,
    required this.initialMovies,
  });

  //Esta función limita la búsqueda de nuevas películas hasta que se deja de escribir por 0.5sec
  void _onChange(String query) {
    isLoading.add(true);

    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer!.cancel();
    }

    _debounceTimer = Timer(const Duration(milliseconds: 600), () async {
      final movies = await searchMovies(query);

      initialMovies = movies;
      currentSearchedMovies.add(movies);
      isLoading.add(false);
    });
  }

  void _clearStreams() {
    currentSearchedMovies.close();
  }

  StreamBuilder<List<Movie>> _listBuilder() {
    return StreamBuilder(
      initialData: initialMovies,
      stream: currentSearchedMovies.stream,
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) => _MovieSearchItem(
            movie: movies[index],
            movieSelected: (context, movie) {
              _clearStreams();
              close(context, movie);
            },
          ),
        );
      },
    );
  }

  @override
  String get searchFieldLabel => 'Search film';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      StreamBuilder(
        initialData: false,
        stream: isLoading.stream,
        builder: (context, snapshot) {
          if (snapshot.data ?? false) {
            return SpinPerfect(
              duration: const Duration(seconds: 2),
              infinite: true,
              child: IconButton(
                onPressed: () => query = '',
                icon: const Icon(
                  Icons.refresh,
                ),
              ),
            );
          }
          return FadeIn(
            animate: query.isNotEmpty,
            duration: const Duration(milliseconds: 500),
            child: IconButton(
              onPressed: () => query = '',
              icon: const Icon(
                Icons.clear,
              ),
            ),
          );
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      //Si la persona no selecciona nada y le da back, devuelve null
      onPressed: () {
        _clearStreams();
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back_outlined,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _listBuilder();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onChange(query);

    return _listBuilder();
  }
}

class _MovieSearchItem extends StatelessWidget {
  const _MovieSearchItem({
    required this.movie,
    required this.movieSelected,
  });

  final Movie movie;
  final Function movieSelected;

  @override
  Widget build(BuildContext context) {
    final themes = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => movieSelected(context, movie),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.2,
              height: size.height * 0.15,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movie.posterPath,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) =>
                      FadeIn(child: child),
                ),
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: themes.titleMedium,
                  ),
                  Text(
                    movie.overview,
                    maxLines: 3,
                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star_rate, color: Colors.yellowAccent),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        HumanFormats.number(movie.voteAverage, 1),
                        style: themes.bodyMedium!.copyWith(
                          color: Colors.yellow.shade900,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
