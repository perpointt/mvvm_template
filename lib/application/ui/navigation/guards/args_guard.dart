part of 'guards.dart';

class ArgsGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (resolver.route.args == null) {
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
