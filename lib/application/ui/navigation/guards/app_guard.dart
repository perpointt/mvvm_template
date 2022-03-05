part of 'guards.dart';

class AppGuard extends AutoRouteGuard {
  final AuthService service;

  AppGuard(this.service);
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final isAuth = await service.isAuth();
    if (!isAuth) {
      router.removeUntil((route) => false);
      router.pushNamed(AppRouteNames.login);
    } else {
      resolver.next(true);
    }
  }
}
