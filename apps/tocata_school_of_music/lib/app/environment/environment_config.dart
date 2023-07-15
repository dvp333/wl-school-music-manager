import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tocata_school_of_music/app/environment/enviroments.dart';

class EnvironmentConfig {
  EnvironmentConfig._();

  static late Environments env;

  static Future<void> init([
    Environments environment = Environments.prod,
  ]) async {
    env = environment;
    await _loadEnvVars();
  }

  static Future<void> _loadEnvVars() async {
    await dotenv.load(fileName: 'lib/app/environment/assets/${env.name}/.env');
  }
}
