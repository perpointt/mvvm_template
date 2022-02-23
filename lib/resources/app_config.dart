part of 'resources.dart';

enum Environment { develop, production, testing }

/// Главный конфиг приложения
///
/// Класс реализован для ручного контроля среды разработки
///
/// Пример:
/// Можно отображать в production только часть данных,
/// а в develop все данные (для более удобной отладки)
abstract class AppConfig {
  static late final Environment _environment;

  static Environment get environment => _environment;

  static bool get isProduction => _environment == Environment.production;

  static bool get isDebug => _environment == Environment.develop;

  /// [environment] может быть null чтобы автоматически определять среду
  static void init([Environment? environment]) {
    if (environment == null) {
      _environment = kDebugMode ? Environment.develop : Environment.production;
    } else {
      _environment = environment;
    }
  }
}
