import 'package:cinema_wisdom/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:cinema_wisdom/infrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMovieDbDatasource());
});
