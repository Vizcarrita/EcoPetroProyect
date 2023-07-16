import '../../domain/domain.dart';

class UserMapper {
  static User userJsonToEntity(Map<String, dynamic> json) => User(
        id: json['id'],
        nombre: json['nombre'],
        apellido: json['apellido'],
        correo: json['correo'],
        token: json['token'],
        foto: json['foto'],
      );
}
