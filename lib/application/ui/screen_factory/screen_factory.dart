import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/application/ui/screens/home_screen.dart';
import 'package:template/application/ui/screens/login_screen.dart';
import 'package:template/application/ui/widgets/loader_widget/loader_view_model.dart';
import 'package:template/application/ui/widgets/loader_widget/loader_widget.dart';

class ScreenFactory {
  Widget makeLoader() {
    return Provider(
      child: const LoaderWidget(),
      create: (context) => LoaderViewModel(context),
      lazy: false,
    );
  }

  Widget makeHome() {
    return const HomeScreen();
  }

  Widget makeLogin() {
    return const LoginScreen();
  }
}
