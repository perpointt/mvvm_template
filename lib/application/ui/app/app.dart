import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:template/application/ui/navigation/main_navigation.dart';
import 'package:template/application/ui/themes/app_theme.dart';
import 'package:template/resources/resources.dart';

class App extends StatelessWidget {
  final mainNavigation = MainNavigation();
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routes: mainNavigation.routes,
      supportedLocales: const [
        Locale('ru', 'RU'),
      ],
      theme: AppTheme.light,
      debugShowCheckedModeBanner: AppConfig.isDebug,
      initialRoute: MainNavigationRouteNames.loaderWidget,
    );
  }
}
