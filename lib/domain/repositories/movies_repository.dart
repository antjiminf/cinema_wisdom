import 'package:cinema_wisdom/domain/entities/movie.dart';
import 'package:cinema_wisdom/domain/entities/video.dart';

abstract class MovieRepository {
  Future<List<Movie>> getNowShowing({int page = 1});
  Future<List<Movie>> getPopular({int page = 1});
  Future<List<Movie>> getUpcoming({int page = 1});
  Future<List<Movie>> getTopRated({int page = 1});
  Future<Movie> getMovieById(String id);
  Future<List<Movie>> searchMovies(String query);
  Future<List<Movie>> getSimilarMovies(int movieId);
  Future<List<Video>> getYoutubeVideosById(int movieId);
}
