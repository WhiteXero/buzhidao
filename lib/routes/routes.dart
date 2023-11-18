import 'package:buzhidao/screens/tutorial.dart';
import 'package:go_router/go_router.dart';

import '../screens/home.dart';
import '../screens/init.dart';
import '../screens/intro.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'init',
      path: '/',
      builder: (context, state) => const InitPage(),
    ),
    GoRoute(
      name: 'tutorial',
      path: '/tutorial',
      builder: (context, state) => const Tutorial(),
    ),
    GoRoute(
      name: 'intro',
      path: '/intro',
      builder: (context, state) => const Intro(),
    ),
    GoRoute(
      name: 'home',
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
  ],
);
