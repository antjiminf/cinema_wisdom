import 'package:cinema_wisdom/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinema_wisdom/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Inmutable repository provided to access our datasource (dependency injection)
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MovieDbDatasource());
});
