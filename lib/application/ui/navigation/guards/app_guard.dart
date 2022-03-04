part of 'guards.dart';

class AppGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final service = AuthService();
    final isAuth = await service.isAuth();
    if (!isAuth) {
      router.removeUntil((route) => false);
      router.pushNamed(AppRouteNames.login);
    } else {
      resolver.next(true);
    }
  }
}
