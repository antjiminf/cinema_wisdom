import 'package:cinema_wisdom/domain/entities/movie.dart';
import 'package:cinema_wisdom/presentation/providers/movies/movie_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieDetailsProvider =
    StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final fetchMovieDetails = ref.watch(movieRepositoryProvider).getMovieById;
  return MovieMapNotifier(getMovie: fetchMovieDetails);
});

typedef GetMovieDetailsCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  MovieMapNotifier({required this.getMovie}) : super({});

  final GetMovieDetailsCallback getMovie;

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;

    final movie = await getMovie(movieId);
    state = {...state, movieId: movie};
  }
}
