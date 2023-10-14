import 'package:cinema_wisdom/domain/entities/movie.dart';
import 'package:cinema_wisdom/infrastructure/models/moviedb/movie_item.dart';

class MovieMapper {
  static Movie movieDbToEntity(MovieItem movieItem) => Movie(
        adult: movieItem.adult,
        backdropPath: movieItem.backdropPath != ''
            ? 'https://image.tmdb.org/t/p/w500${movieItem.backdropPath}'
            : 'https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg',
        genreIds: movieItem.genreIds.map((e) => e.toString()).toList(),
        id: movieItem.id,
        originalLanguage: movieItem.originalLanguage,
        originalTitle: movieItem.originalTitle,
        overview: movieItem.overview,
        popularity: movieItem.popularity,
        posterPath: movieItem.posterPath != ''
            ? 'https://image.tmdb.org/t/p/w500${movieItem.posterPath}'
            : 'https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg',
        releaseDate: movieItem.releaseDate,
        title: movieItem.title,
        video: movieItem.video,
        voteAverage: movieItem.voteAverage,
        voteCount: movieItem.voteCount,
      );
}
