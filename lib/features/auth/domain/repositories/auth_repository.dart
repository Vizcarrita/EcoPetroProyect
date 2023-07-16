import '../entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String correo, String pass);
  Future<User> checkAuthStatus(String token);
}
