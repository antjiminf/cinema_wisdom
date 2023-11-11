import 'package:cinema_wisdom/domain/entities/movie.dart';
import 'package:cinema_wisdom/domain/repositories/local_storage_repository.dart';
import 'package:cinema_wisdom/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoritesMoviesProvider =
    StateNotifierProvider<StorageMovieNotifier, Map<int, Movie>>((ref) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);
  return StorageMovieNotifier(localStorageRepository: localStorageRepository);
});

class StorageMovieNotifier extends StateNotifier<Map<int, Movie>> {
  StorageMovieNotifier({
    required this.localStorageRepository,
  }) : super({});

  int page = 0;
  final LocalStorageRepository localStorageRepository;

  Future<List<Movie>> loadNextPage() async {
    //page = 0 * 10 => 0 -> empieza desde el elemento 0 en el siguiente 10 -> 20
    final movies =
        await localStorageRepository.loadMovies(offset: page * 10, limit: 20);
    page++;

    final tempMovies = <int, Movie>{};
    for (var movie in movies) {
      tempMovies[movie.id] = movie;
    }

    state = {...state, ...tempMovies};
    return movies;
  }

  Future<void> toggleFavorite(Movie movie) async {
    await localStorageRepository.toggleFavorites(movie);
    final bool isMovieFavorite = state[movie.id] != null;

    if (isMovieFavorite) {
      state.remove(movie.id);
      state = {...state};
    } else {
      state = {...state, movie.id: movie};
    }
  }
}
