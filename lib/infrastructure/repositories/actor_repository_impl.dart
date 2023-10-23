import 'package:cinema_wisdom/domain/datasources/actor_datasource.dart';
import 'package:cinema_wisdom/domain/entities/actor.dart';
import 'package:cinema_wisdom/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorRepository {
  final ActorDatasource datasource;

  ActorRepositoryImpl(this.datasource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }
}
