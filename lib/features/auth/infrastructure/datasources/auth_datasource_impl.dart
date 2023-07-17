// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:example_ecopetro/config/config.dart';
import 'package:example_ecopetro/features/auth/domain/domain.dart';
import 'package:example_ecopetro/features/auth/infrastructure/infrastructure.dart';

class AuthDataSourceImpl extends AuthDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.backend,
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
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        throw CustomError(
            e.response?.data['message'] ?? 'Credenciales incorrectas');
      }
      if (e.type == DioErrorType.connectionTimeout) {
        throw CustomError('Revisar conexion a internet');
      }
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }
}
