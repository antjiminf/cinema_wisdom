import 'package:cinema_wisdom/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state) {
        final pageIndex = int.parse(state.pathParameters['page'] ?? '0');
        //Podría validar el número en caso de que sea web
        // if (HomeScreen.viewRoutes.length <= pageIndex) {
        //   return HomeScreen(pageIndex: pageIndex);
        // }
        return HomeScreen(pageIndex: pageIndex);
      },
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
    GoRoute(
      path: '/',
      redirect: (_, __) => '/home/0',
    ),
  ],
);
