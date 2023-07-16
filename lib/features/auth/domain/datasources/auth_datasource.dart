import '../entities/user.dart';

abstract class AuthDataSource {
  Future<User> login(String correo, String pass);
  Future<User> checkAuthStatus(String token);
}
