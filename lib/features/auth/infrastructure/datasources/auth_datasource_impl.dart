import 'package:dio/dio.dart';
import 'package:example_ecopetro/config/config.dart';
import 'package:example_ecopetro/features/auth/domain/domain.dart';

import '../infrastructure.dart';

class AuthDataSourceImpl extends AuthDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.backend,
      // contentType: 'application/json',
      // responseType: ResponseType.json,
    ),
  );

  @override
  Future<User> checkAuthStatus(String token) {
    // TODO: implement checkAuthStatus
    throw UnimplementedError();
  }

  @override
  Future<User> login(String correo, String pass) async {
    try {
      final response = await dio.post(
        '/usuarios/login',
        data: {
          'correo': correo,
          'pass': pass,
        },
      );
      final user = UserMapper.userJsonToEntity(response.data);
      return user;
    } catch (e) {
      throw WrongCredentials();
    }
  }
}
