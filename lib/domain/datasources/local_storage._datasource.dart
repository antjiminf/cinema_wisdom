import 'package:cinema_wisdom/domain/entities/movie.dart';

abstract class LocalStorageDatasource {
  Future<void> toggleFavorites(Movie movie);

  Future<bool> isFavoriteMovie(int movieId);

  Future<List<Movie>> loadMovies({int limit = 10, offset = 0});
}
