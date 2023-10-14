import 'package:cinema_wisdom/config/constants/environment.dart';
import 'package:cinema_wisdom/domain/datasources/movies_datasource.dart';
import 'package:cinema_wisdom/domain/entities/movie.dart';
import 'package:cinema_wisdom/infrastructure/mappers/movie_mapper.dart';
import 'package:cinema_wisdom/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MovieDbDatasource extends MovieDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.movieDbKey,
      'language': 'es',
    },
  ));
  @override
  Future<List<Movie>> getNowShowing({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');
    final movieDbResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDbResponse.results
        .map((e) => MovieMapper.movieDbToEntity(e))
        .toList();
    return movies;
  }
}
