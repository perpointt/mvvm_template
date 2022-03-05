import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:oktoast/oktoast.dart';
import 'package:template/application/ui/navigation/guards/guards.dart';
import 'package:template/application/ui/screens/home_widget/home_screen.dart';
import 'package:template/application/ui/screens/home_widget/home_view_model.dart';
import 'package:template/application/ui/screens/login_screen.dart';
import 'package:template/application/ui/screens/not_found_screen.dart';

import 'package:provider/provider.dart';
import 'package:template/application/ui/screens/second_screen.dart';
import 'package:template/application/ui/widgets/loader.dart';
import 'package:template/domain/services/auth_service.dart';

part 'app_navigator.gr.dart';
part 'screen_factory.dart';
part 'app_route_names.dart';

/// https://autoroute.vercel.app/introduction
/// Auto-Router генератор
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

/// Класс для наследования сгененированного роутера
class _Router extends _$_Router {
  static final _service = AuthService();
  _Router()
      : super(appGuard: AppGuard(_service), authGuard: AuthGuard(_service));
}

/// Класс для удобного управления навигацией в приложении
abstract class AppRouter {
  static final _router = _Router();
  static _Router get instance => _router;

  static bool _isDialogOpened = false;
  static bool get isDialogOpened => _isDialogOpened;

  static Future<T?> pushNamed<T extends Object?>(
    String path, {
    bool includePrefixMatches = false,
    OnNavigationFailure? onFailure,
  }) async {
    await closeDialog();
    return _router.pushNamed<T>(
      path,
      includePrefixMatches: includePrefixMatches,
      onFailure: onFailure,
    );
  }

  static Future<T?> push<T extends Object?>(PageRouteInfo route,
      {OnNavigationFailure? onFailure}) async {
    await closeDialog();
    return _router.push(route, onFailure: onFailure);
  }

  static Future<bool> pop<T extends Object?>([T? result]) {
    if (_router.canNavigateBack) return _router.pop();
    return SynchronousFuture<bool>(false);
  }

  static Future<bool> closeDialog<T extends Object?>([T? result]) {
    if (_isDialogOpened) {
      _isDialogOpened = false;
      return pop<T>();
    } else {
      return SynchronousFuture<bool>(false);
    }
  }

  static Future<T?> openDialog<T>({
    required BuildContext context,
    required Widget dialog,
    bool barrierDismissible = true,
    Color? barrierColor = Colors.black54,
  }) async {
    await closeDialog();
    _isDialogOpened = true;
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      builder: (_) => dialog,
    ).then((value) {
      _isDialogOpened = false;
      return value;
    });
  }

  static Future<T?> openLoadingDialog<T>(BuildContext context) {
    return openDialog<T>(
      context: context,
      barrierColor: Colors.white.withOpacity(0.5),
      barrierDismissible: false,
      dialog: const Loader(),
    );
  }

  static ToastFuture toast(
    String title, {
    EdgeInsets padding = const EdgeInsets.only(right: 16),
  }) {
    return showToastWidget(
      Container(),
      handleTouch: true,
      dismissOtherToast: true,
      duration: const Duration(seconds: 3),
    );
  }
}
