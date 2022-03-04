// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_navigator.dart';

class _$_Router extends RootStackRouter {
  _$_Router(
      {GlobalKey<NavigatorState>? navigatorKey,
      required this.appGuard,
      required this.authGuard})
      : super(navigatorKey);

  final AppGuard appGuard;

  final AuthGuard authGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    _HomeRoute.name: (routeData) {
      return MaterialPageX<String>(
          routeData: routeData, child: const _HomeScreen());
    },
    SecondRoute.name: (routeData) {
      return MaterialPageX<String>(
          routeData: routeData, child: const SecondScreen());
    },
    LoginRoute.name: (routeData) {
      return MaterialPageX<String>(
          routeData: routeData, child: const LoginScreen());
    },
    NotFoundRoute.name: (routeData) {
      return MaterialPageX<String>(
          routeData: routeData, child: const NotFoundScreen());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: '/home', fullMatch: true),
        RouteConfig(_HomeRoute.name, path: '/home', guards: [appGuard]),
        RouteConfig(SecondRoute.name, path: '/second', guards: [appGuard]),
        RouteConfig(LoginRoute.name, path: '/login', guards: [authGuard]),
        RouteConfig(NotFoundRoute.name, path: '/404'),
        RouteConfig('*#redirect',
            path: '*', redirectTo: '/404', fullMatch: true)
      ];
}

/// generated route for
/// [_HomeScreen]
class _HomeRoute extends PageRouteInfo<void> {
  const _HomeRoute() : super(_HomeRoute.name, path: '/home');

  static const String name = '_HomeRoute';
}

/// generated route for
/// [SecondScreen]
class SecondRoute extends PageRouteInfo<void> {
  const SecondRoute() : super(SecondRoute.name, path: '/second');

  static const String name = 'SecondRoute';
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [NotFoundScreen]
class NotFoundRoute extends PageRouteInfo<void> {
  const NotFoundRoute() : super(NotFoundRoute.name, path: '/404');

  static const String name = 'NotFoundRoute';
}
