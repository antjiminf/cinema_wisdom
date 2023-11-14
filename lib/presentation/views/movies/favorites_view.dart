import 'package:cinema_wisdom/presentation/providers/providers.dart';
import 'package:cinema_wisdom/presentation/widgets/movies/movie_masonry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView>
    with AutomaticKeepAliveClientMixin {
  bool isLoading = false;
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void loadNextPage() async {
    if (isLoading || isLastPage) return;
    isLoading = true;

    final movies =
        await ref.read(favoritesMoviesProvider.notifier).loadNextPage();
    isLoading = false;

    if (movies.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final favoritesMovies = ref.watch(favoritesMoviesProvider).values.toList();

    if (favoritesMovies.isEmpty) {
      return _NoFavoritesWidget();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Favorites Films'),
        ),
      ),
      body: MovieMasonry(
        movies: favoritesMovies,
        loadNextPage: loadNextPage,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _NoFavoritesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Favorite Films'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_outline_sharp,
              size: 50,
              color: colors.primary,
            ),
            const SizedBox(height: 10),
            Text(
              'Empty List',
              style: TextStyle(
                fontSize: 25,
                color: colors.primary,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Unfortunately you do not have favorites films :(',
                style: TextStyle(
                  fontSize: 15,
                  color: colors.secondary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FilledButton.tonal(
              onPressed: () => context.go('/home/0'),
              child: const Text('Search them!'),
            ),
          ],
        ),
      ),
    );
  }
}
