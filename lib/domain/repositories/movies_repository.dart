import 'package:cinema_wisdom/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getNowShowing({int page = 1});
}
