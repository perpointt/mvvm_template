import 'package:flutter/material.dart';
import 'package:template/application/ui/navigation/main_navigation.dart';
import 'package:template/domain/services/auth_service.dart';

/// ViewModel для LoaderWidged
///
/// С помощью него идет осуществляется проверка сессии пользователя
///
/// [context] - используется для навигации
class LoaderViewModel {
  final BuildContext context;
  final _authService = AuthService();

  LoaderViewModel(this.context) {
    _asyncInit();
  }

  Future<void> _asyncInit() async {
    await _checkAuth();
  }

  Future<void> _checkAuth() async {
    final isAuth = await _authService.isAuth();
    // TODO
    // Вместо домашней страницы можно перекидывать на deeplink
    final nextScreen = isAuth
        ? MainNavigationRouteNames.homeWidget
        : MainNavigationRouteNames.loginWidget;

    Navigator.of(context).pushReplacementNamed(nextScreen);
  }
}
