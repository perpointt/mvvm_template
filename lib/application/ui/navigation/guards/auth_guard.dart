part of 'guards.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthService service;

  AuthGuard(this.service);
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final isAuth = await service.isAuth();

    if (isAuth) {
      final last =
          (router.stack.isEmpty ? null : router.stack.last.routeData.path) ??
              AppRouteNames.home;
      final path = last.contains('/') ? last : '/$last';
      router.removeLast();
      router.pushNamed(path);
    } else {
      resolver.next(true);
    }
  }
}
