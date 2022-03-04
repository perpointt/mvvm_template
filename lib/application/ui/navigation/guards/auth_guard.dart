part of 'guards.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final service = AuthService();
    final isAuth = await service.isAuth();

    final last =
        (router.stack.isEmpty ? null : router.stack.last.routeData.path) ??
            AppRouteNames.home;

    if (isAuth) {
      final path = last.contains('/') ? last : '/$last';
      router.removeLast();
      router.pushNamed(path);
    } else {
      resolver.next(true);
    }
  }
}
