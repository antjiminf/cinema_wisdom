import 'package:cinema_wisdom/config/constants/environment.dart';
import 'package:cinema_wisdom/domain/datasources/actor_datasource.dart';
import 'package:cinema_wisdom/domain/entities/actor.dart';
import 'package:cinema_wisdom/infrastructure/mappers/actor_mapper.dart';
import 'package:cinema_wisdom/infrastructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

class ActorMovieDbDatasource extends ActorDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.movieDbKey,
      'language': 'en',
    },
  ));

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(response.data);

    final List<Actor> actors = creditsResponse.cast
        .map((actor) => ActorMapper.castToEntity(actor))
        .toList();
    return actors;
  }
}
