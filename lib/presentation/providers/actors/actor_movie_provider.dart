import 'package:cinema_wisdom/domain/entities/actor.dart';
import 'package:cinema_wisdom/presentation/providers/actors/actor_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMovieMapNotifier, Map<String, List<Actor>>>(
        (ref) {
  final fetchActors = ref.watch(actorRepositoryProvider).getActorsByMovie;
  return ActorsByMovieMapNotifier(getActors: fetchActors);
});

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorsByMovieMapNotifier extends StateNotifier<Map<String, List<Actor>>> {
  ActorsByMovieMapNotifier({required this.getActors}) : super({});

  final GetActorsCallback getActors;

  Future<void> loadActor(String movieId) async {
    if (state[movieId] != null) return;

    final List<Actor> actors = await getActors(movieId);
    state = {...state, movieId: actors};
  }
}
