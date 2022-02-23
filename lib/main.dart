import 'package:flutter/material.dart';
import 'package:template/application/ui/app/app.dart';
import 'package:template/resources/resources.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppConfig.init();

  runApp(App());
}
