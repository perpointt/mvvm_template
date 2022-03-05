part of 'app_navigator.dart';

/// Класс для генерации экранов
/// Если в приложении появляется новая страница, необходимо добавить ее сюда
/// С его помощью удобно отделять верстку от ViewModel
abstract class ScreenFactory {
  static const loginScreen = LoginScreen;
  static const homeScreen = _HomeScreen;
  static const notFoundScreen = NotFoundScreen;
  static const secondScreen = SecondScreen;
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      child: const HomeScreen(),
      create: (context) => HomeViewModel(),
    );
  }
}
