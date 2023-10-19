import 'package:cinema_wisdom/domain/entities/movie.dart';
import 'package:cinema_wisdom/presentation/providers/movies/movie_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchNewMovies = ref.watch(movieRepositoryProvider).getNowShowing;
  return MoviesNotifier(fetchNewMovies: fetchNewMovies);
});

final popularMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchPopularMovies = ref.watch(movieRepositoryProvider).getPopular;
  return MoviesNotifier(fetchNewMovies: fetchPopularMovies);
});

final upcomingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchUpcomingMovies = ref.watch(movieRepositoryProvider).getUpcoming;
  return MoviesNotifier(fetchNewMovies: fetchUpcomingMovies);
});

final topRatedMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchTopRatedMovies = ref.watch(movieRepositoryProvider).getTopRated;
  return MoviesNotifier(fetchNewMovies: fetchTopRatedMovies);
});

typedef NewMoviesCallBack = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;
  NewMoviesCallBack fetchNewMovies;
  MoviesNotifier({required this.fetchNewMovies}) : super([]);

  Future<void> loadNextPage() async {
    if (isLoading) return;

    currentPage++;
    isLoading = true;

    final List<Movie> movies = await fetchNewMovies(page: currentPage);
    state = [...state, ...movies];

    Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
    //Manejamos el booleano para que no se carguen más de 1 página simultaneamente
  }
}
