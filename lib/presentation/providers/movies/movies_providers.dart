import 'package:cinema_wisdom/domain/entities/movie.dart';
import 'package:cinema_wisdom/presentation/providers/movies/movie_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchNewMovies = ref.watch(movieRepositoryProvider).getNowShowing;
  return MoviesNotifier(fetchNewMovies: fetchNewMovies);
});

typedef NewMoviesCallBack = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  NewMoviesCallBack fetchNewMovies;
  MoviesNotifier({required this.fetchNewMovies}) : super([]);

  Future<void> loadNextPage() async {
    currentPage++;

    final List<Movie> movies = await fetchNewMovies(page: currentPage);
    state = [...state, ...movies];
  }
}
