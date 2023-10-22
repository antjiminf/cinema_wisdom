import 'package:cinema_wisdom/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) {
            final String movieId = state.pathParameters['id'] ?? 'unkown';
            return MovieScreen(movieId: movieId);
          },
        ),
      ],
    ),
  ],
);
