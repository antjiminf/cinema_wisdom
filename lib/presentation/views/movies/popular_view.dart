import 'package:cinema_wisdom/presentation/providers/movies/movies_providers.dart';
import 'package:cinema_wisdom/presentation/widgets/movies/movie_masonry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopularView extends ConsumerStatefulWidget {
  const PopularView({super.key});

  @override
  PopularViewState createState() => PopularViewState();
}

class PopularViewState extends ConsumerState<PopularView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final popularMovies = ref.watch(popularMoviesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
      ),
      body: MovieMasonry(
        loadNextPage: ref.read(popularMoviesProvider.notifier).loadNextPage,
        movies: popularMovies,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
