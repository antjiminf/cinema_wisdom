import 'package:cinema_wisdom/domain/entities/movie.dart';
import 'package:cinema_wisdom/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchedMoviesProvider =
    StateNotifierProvider<SearchedMoviesNotifier, List<Movie>>(
  (ref) {
    final movieRepository = ref.read(movieRepositoryProvider);
    return SearchedMoviesNotifier(
      ref: ref,
      searchMovies: movieRepository.searchMovies,
    );
  },
);

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchedMoviesNotifier extends StateNotifier<List<Movie>> {
  SearchedMoviesNotifier({required this.ref, required this.searchMovies})
      : super([]);

  final SearchMoviesCallback searchMovies;
  final Ref ref;

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    final List<Movie> movies = await searchMovies(query);

    ref.read(searchQueryProvider.notifier).update((state) => query);
    //En este caso queremos actualizar la lista sin aprovechar los datos anteriores
    state = movies;
    return movies;
  }
}
