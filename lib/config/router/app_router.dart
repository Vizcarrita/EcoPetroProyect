import 'package:go_router/go_router.dart';
import 'package:example_ecopetro/pages/auth/auth.dart';
import 'package:example_ecopetro/pages/trucks/trucks.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ///* Auth Routes
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),

    ///* Trucks Routes
    GoRoute(
      path: '/',
      builder: (context, state) => const TrucksScreen(),
    ),
  ],
);
