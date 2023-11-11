import 'package:cinema_wisdom/domain/datasources/local_storage._datasource.dart';
import 'package:cinema_wisdom/domain/entities/movie.dart';
import 'package:cinema_wisdom/domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  LocalStorageRepositoryImpl({required this.datasource});

  final LocalStorageDatasource datasource;

  @override
  Future<bool> isFavoriteMovie(int movieId) {
    return datasource.isFavoriteMovie(movieId);
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) {
    return datasource.loadMovies(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavorites(Movie movie) {
    return datasource.toggleFavorites(movie);
  }
}
