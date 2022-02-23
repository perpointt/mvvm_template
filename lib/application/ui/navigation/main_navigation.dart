import 'package:flutter/material.dart';
import 'package:template/application/ui/screen_factory/screen_factory.dart';

abstract class MainNavigationRouteNames {
  static const loaderWidget = '/';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.loaderWidget: (context) =>
        _screenFactory.makeLoader(),
  };
}
