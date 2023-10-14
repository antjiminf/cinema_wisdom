import 'package:cinema_wisdom/domain/datasources/movies_datasource.dart';
import 'package:cinema_wisdom/domain/entities/movie.dart';
import 'package:cinema_wisdom/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieDatasource datasource;

  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowShowing({int page = 1}) {
    return datasource.getNowShowing(page: page);
  }
}
