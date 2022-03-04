import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:template/application/ui/navigation/guards/guards.dart';
import 'package:template/application/ui/screens/home_widget/home_screen.dart';
import 'package:template/application/ui/screens/home_widget/home_view_model.dart';
import 'package:template/application/ui/screens/login_screen.dart';
import 'package:template/application/ui/screens/not_found_screen.dart';

import 'package:provider/provider.dart';
import 'package:template/application/ui/screens/second_screen.dart';

part 'app_navigator.gr.dart';
part 'screen_factory.dart';
part 'app_route_names.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page|Screen|Dialog,Route',
  routes: <AutoRoute>[
    AutoRoute<String>(
      path: AppRouteNames.home,
      page: ScreenFactory.homeScreen,
      initial: true,
      guards: [AppGuard],
    ),
    AutoRoute<String>(
      path: AppRouteNames.second,
      page: ScreenFactory.secondScreen,
      guards: [AppGuard],
    ),
    AutoRoute<String>(
      path: AppRouteNames.login,
      page: ScreenFactory.loginScreen,
      guards: [AuthGuard],
    ),
    AutoRoute<String>(
      path: AppRouteNames.notFound,
      page: ScreenFactory.notFoundScreen,
    ),
    RedirectRoute(path: '*', redirectTo: AppRouteNames.notFound),
  ],
)
class _Router extends _$_Router {
  _Router() : super(appGuard: AppGuard(), authGuard: AuthGuard());
}

abstract class AppRouter {
  static final _router = _Router();

  static _Router get instance => _router;
}
