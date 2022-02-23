part of 'resources.dart';

enum Environment { develop, production, testing }

abstract class AppConfig {
  static late final Environment _environment;

  static Environment get environment => _environment;

  static bool get isProduction => _environment == Environment.production;

  static void init([Environment? environment]) {
    if (environment == null) {
      _environment = kDebugMode ? Environment.develop : Environment.production;
    } else {
      _environment = environment;
    }
  }
}
