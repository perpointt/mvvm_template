import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:template/application/ui/navigation/app_navigator.dart';
import 'package:template/application/ui/themes/app_theme.dart';
import 'package:template/resources/resources.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => MaterialApp.router(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ru', 'RU'),
        ],
        debugShowCheckedModeBanner: AppConfig.isDebug,
        theme: AppTheme.light,
        routerDelegate: AppRouter.instance.delegate(),
        routeInformationProvider: AppRouter.instance.routeInfoProvider(),
        routeInformationParser: AppRouter.instance.defaultRouteParser(),
        builder: (context, child) {
          ScreenUtil.setContext(context);
          return _AppObserver(
            child: child ?? Container(),
          );
        },
      ),
    );
  }
}

class _AppObserver extends StatelessWidget {
  final Widget child;
  const _AppObserver({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: child,
      ),
    );
  }
}
