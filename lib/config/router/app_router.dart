import 'package:go_router/go_router.dart';
import 'package:example_ecopetro/pages/auth/auth.dart';
import 'package:example_ecopetro/pages/stadistic/stadistic.dart';
import '../../pages/trucks/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/users',
  routes: [
    ///* Auth Routes
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),

    ///* Trucks Routes
    GoRoute(
      path: '/',
      builder: (context, state) => const ImagesVerify(),
    ),

    ///* DashBoard Routes
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const StadisticScreen(),
    ),

    ///* Users Routes
    GoRoute(
      path: '/users',
      builder: (context, state) => const ListUsers(),
    ),
  ],
);
