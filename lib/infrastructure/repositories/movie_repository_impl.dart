import 'package:cinema_wisdom/domain/datasources/movies_datasource.dart';
import 'package:cinema_wisdom/domain/entities/movie.dart';
import 'package:cinema_wisdom/domain/entities/video.dart';
import 'package:cinema_wisdom/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieDatasource datasource;

  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowShowing({int page = 1}) {
    return datasource.getNowShowing(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return datasource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return datasource.getTopRated(page: page);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return datasource.getUpcoming(page: page);
  }

  @override
  Future<Movie> getMovieById(String id) {
    return datasource.getMovieById(id);
  }

  @override
  Future<List<Movie>> searchMovies(String query) {
    return datasource.searchMovies(query);
  }

  @override
  Future<List<Movie>> getSimilarMovies(int movieId) {
    return datasource.getSimilarMovies(movieId);
  }

  @override
  Future<List<Video>> getYoutubeVideosById(int movieId) {
    return datasource.getYoutubeVideosById(movieId);
  }
}
