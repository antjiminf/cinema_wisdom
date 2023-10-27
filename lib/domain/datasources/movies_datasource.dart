import 'package:cinema_wisdom/domain/entities/movie.dart';

abstract class MovieDatasource {
  Future<List<Movie>> getNowShowing({int page = 1});

  Future<List<Movie>> getPopular({int page = 1});

  Future<List<Movie>> getTopRated({int page = 1});

  Future<List<Movie>> getUpcoming({int page = 1});

  Future<Movie> getMovieById(String id);

  Future<List<Movie>> searchMovies(String query);
}
