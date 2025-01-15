import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maahi_lms/src/cores/cores.dart';
import 'package:maahi_lms/src/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      context.go(RoutesName.intro);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Course"),
      ),
    );
  }
}
