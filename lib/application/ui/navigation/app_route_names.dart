part of 'app_navigator.dart';

abstract class AppRouteNames {
  static const initial = '/';
  static const home = '/home';

  static const second = '/second';

  static const login = '/login';
  static const register = '/register';
  static const resetPassword = '/resetPassword';

  static const notFound = '/404';

  List<String> get authenticationNames => [login, register, resetPassword];
}
