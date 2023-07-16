import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:example_ecopetro/features/auth/infrastructure/infrastructure.dart';
import '../../domain/domain.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = AuthRepositoryImpl();

  return AuthNotifier(authRepository: authRepository);
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;

  AuthNotifier({required this.authRepository}) : super(AuthState());

  Future<void> loginUser(String correo, String pass) async {
    try {
      final user = await authRepository.login(correo, pass);
      _setLoggerUser(user);
    } on WrongCredentials {
      logout('Credenciales no son correctas');
    } catch (e) {
      logout('Error desconocido');
    }
    // final user = await authRepository.login(correo, pass);
    // state = state.copyWith( user: user, authStatus.authenticated,);
  }

  void checkAuthStatus() async {}

  void _setLoggerUser(User user) {
    // TODO: necesito guardar el token fisicamente
    state = state.copyWith(
      user: user,
      authStatus: AuthStatus.authenticated,
    );
  }

  Future<void> logout([String? errorMessage]) async {
    // TODO: limpiar token
    state = state.copyWith(
      user: null,
      authStatus: AuthStatus.notAuthenticated,
      errorMessage: errorMessage,
    );
  }
}

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthState {
  final AuthStatus authStatus;
  final User? user;
  final String errorMessage;

  AuthState(
      {this.authStatus = AuthStatus.checking,
      this.user,
      this.errorMessage = ''});
  AuthState copyWith(
          {AuthStatus? authStatus, User? user, String? errorMessage}) =>
      AuthState(
          authStatus: authStatus ?? this.authStatus,
          user: user ?? this.user,
          errorMessage: errorMessage ?? this.errorMessage);
}
