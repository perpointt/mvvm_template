/// Сервис авторзиации пользователя
class AuthService {
  // TODO
  Future<bool> isAuth() async {
    final isAuth = true;
    await Future<void>.delayed(const Duration(seconds: 2));
    return isAuth;
  }
}
