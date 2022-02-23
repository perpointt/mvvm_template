import 'package:flutter/material.dart';
import 'package:template/domain/services/auth_service.dart';

class LoaderViewModel {
  final BuildContext context;
  final _authService = AuthService();

  LoaderViewModel(this.context) {
    asyncInit();
  }

  Future<void> asyncInit() async {
    await checkAuth();
  }

  Future<void> checkAuth() async {
    final isAuth = await _authService.isAuth();
    // TODO
    final nextScreen = isAuth ? '' : '';

    Navigator.of(context).pushReplacementNamed(nextScreen);
  }
}
