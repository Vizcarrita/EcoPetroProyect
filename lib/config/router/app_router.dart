import 'package:example_ecopetro/features/trucks/presentation/screens/register_guias_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:example_ecopetro/features/auth/auth.dart';

final appRouter = GoRouter(
  initialLocation: '/new-lt',
  routes: [
    ///* Auth Routes
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),

    ///* Trucks Routes
    GoRoute(
      path: '/new-lt',
      builder: (context, state) => const RegisterScreen(),
    ),
  ],
);
