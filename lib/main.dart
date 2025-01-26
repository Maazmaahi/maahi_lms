import 'package:flutter/material.dart';
import 'package:maahi_lms/src/app.dart';
import './src/cores/cores.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  runApp(const MyApp());
}
