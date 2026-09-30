import 'package:go_router/go_router.dart';

import '../screens/estadisticas.dart';
import '../screens/home.dart';
import '../screens/catalogo.dart';
import '../screens/favoritos.dart';
import '../screens/progreso.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: '/catalogo',
      builder: (context, state) => const Catalogo(),
    ),
    GoRoute(
      path: '/favoritos',
      builder: (context, state) => const Favoritos(),
    ),
    GoRoute(
      path: '/progreso',
      builder: (context, state) => const Progreso(),
    ),
    GoRoute(
      path: '/estadisticas',
      builder: (context, state) => const Estadisticas(),
    ),
  ],
);