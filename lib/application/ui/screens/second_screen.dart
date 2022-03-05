import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:template/application/ui/navigation/app_navigator.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AutoBackButton(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'This is Second Screen',
              textAlign: TextAlign.center,
            ),
            MaterialButton(
              onPressed: () => AppRouter.openLoadingDialog<void>(context),
            )
          ],
        ),
      ),
    );
  }
}
