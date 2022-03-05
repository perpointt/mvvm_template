import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/application/ui/navigation/app_navigator.dart';
import 'package:template/application/ui/screens/home_widget/home_view_model.dart';
import 'package:template/resources/resources.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          _IncrementButton(),
          _DecrementButton(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Everything works correctly.\n\n${AppConfig.environment}',
              textAlign: TextAlign.center,
            ),
            const _CountWidget(),
            CupertinoButton(
              onPressed: () =>
                  AppRouter.instance.pushNamed(AppRouteNames.second),
              child: const Text('Go to second screen'),
            )
          ],
        ),
      ),
    );
  }
}

class _IncrementButton extends StatelessWidget {
  const _IncrementButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: const Icon(Icons.plus_one_outlined),
      onPressed: context.read<HomeViewModel>().increment,
    );
  }
}

class _DecrementButton extends StatelessWidget {
  const _DecrementButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: const Icon(Icons.exposure_minus_1_outlined),
      onPressed: context.read<HomeViewModel>().decrement,
    );
  }
}

class _CountWidget extends StatelessWidget {
  const _CountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final count = context.watch<HomeViewModel>().count;
    return Text('Count: $count');
  }
}
