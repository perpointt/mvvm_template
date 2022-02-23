import 'package:flutter/material.dart';
import 'package:template/resources/resources.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Everything works correctly.\n\n${AppConfig.environment}',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
