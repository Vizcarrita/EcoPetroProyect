import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static initEnvironment() async {
    await dotenv.load(fileName: ".env");
  }

  static String backend = dotenv.env['backend'] ?? 'No esta configurado el API';
}
