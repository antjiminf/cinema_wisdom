import 'package:cinema_wisdom/domain/entities/actor.dart';

abstract class ActorRepository {
  Future<List<Actor>> getActorsByMovie(String movieId);
}
