import 'package:flutter/material.dart';
import 'package:template/application/ui/screen_factory/screen_factory.dart';

abstract class MainNavigationRouteNames {
  static const loaderWidget = '/';
  static const homeWidget = '/home';
  static const loginWidget = '/login';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.loaderWidget: (context) =>
        _screenFactory.makeLoader(),
    MainNavigationRouteNames.homeWidget: (context) => _screenFactory.makeHome(),
    MainNavigationRouteNames.loginWidget: (context) =>
        _screenFactory.makeLogin(),
  };
}
